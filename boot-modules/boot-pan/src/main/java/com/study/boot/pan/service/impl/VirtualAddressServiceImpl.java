package com.study.boot.pan.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.oss.service.MinioTemplate;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.Chunk;
import com.study.boot.pan.entity.SysFile;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.mapper.VirtualAddressMapper;
import com.study.boot.pan.service.SysFileService;
import com.study.boot.pan.service.VirtualAddressService;
import com.study.boot.pan.vo.FileDetailVo;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.SneakyThrows;
import org.jodconverter.DocumentConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.UUID;

/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
@Service
public class VirtualAddressServiceImpl extends ServiceImpl<VirtualAddressMapper, VirtualAddress> implements VirtualAddressService {

    @Autowired
    private SysFileService sysFileService;

    @Autowired
    private MinioTemplate minioTemplate;

    @Autowired
    private DocumentConverter converter;

    @Autowired
    private RemoteUserService remoteUserService;

    private static final String PDF =  "pdf";
    /**
     * 创建文件夹
     *
     * @param virtualAddress
     * @return
     */
    @Override
    public WebResponse createFolder(VirtualAddress virtualAddress) {
        List<VirtualAddress> addressList = this.baseMapper.selectList(Wrappers.query(virtualAddress));
        if (CollectionUtil.isNotEmpty(addressList)) {
            return new WebResponse<>(CommonConstants.FAIL, "已存在的文件夹名称");
        }

        virtualAddress.setType(FileContants.FileType.FOLDER.toString());
        virtualAddress.setDelFlag(CommonConstants.STATUS_NORMAL);
        this.baseMapper.insert(virtualAddress);
        return new WebResponse<>(CommonConstants.SUCCESS);
    }

    /**
     * 分页查询
     *
     * @param virtualAddress
     * @return
     */
    @Override
    public List<FileDetailVo> getFileDetailList(VirtualAddress virtualAddress) {
        return this.baseMapper.getFileDetailVoList(virtualAddress);
    }


    /**
     * 保存文件
     * @param md5
     * @param fileName
     * @param oldName
     * @param parentId 父ID
     * @return
     */
    @Override
    @SneakyThrows
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveFile(String md5, String fileName, String oldName,Long size, Long parentId) {
        VirtualAddress virtualAddress = new VirtualAddress();
        SysFile file = sysFileService.getOne(Wrappers.<SysFile>query().lambda().eq(SysFile::getMd5, md5));
        //检查是否存在同名文件
        oldName = this.checkExist(oldName,FileContants.getFileType(oldName), parentId);
        if (file != null) {
            virtualAddress.setFileId(file.getFileId());
        } else {

            SysFile sysFile = new SysFile();
            sysFile.setFileId(UUID.randomUUID().toString());
            sysFile.setFileSize(size);
            sysFile.setMd5(md5);
            sysFile.setFilePath(fileName);
            sysFile.setStatus(CommonConstants.STATUS_NORMAL);
            this.sysFileService.save(sysFile);
            virtualAddress.setFileId(sysFile.getFileId());
        }

        this.baseMapper.insert(virtualAddress);
        return Boolean.TRUE;
    }


    /**
     * 检查是否存在同名文件
     *
     * @param fileName 文件名称
     * @param fileType 文件类型
     * @param parentId 父ID
     * @return
     */
    @Override
    public String checkExist(String fileName, FileContants.FileType fileType, Long parentId) {
        VirtualAddress address = this.baseMapper.selectOne(Wrappers.<VirtualAddress>query().lambda()
                .eq(VirtualAddress::getFileName, fileName)
                .eq(VirtualAddress::getType,fileType.toString())
                .eq(VirtualAddress::getParentId, parentId));
        //存在同名文件
        if (address != null) {
            String newName = fileName.substring(0, fileName.lastIndexOf(StrUtil.DOT));
            fileName = newName + "[" + RandomUtil.randomNumbers(10) + "]" + StrUtil.DOT + FileUtil.extName(fileName);
        }
        return fileName;
    }


    /**
     * 转码
     */
    @Async("taskExecutor")
    @SneakyThrows
    @Override
    public void transferPdf(String fileName, List<Chunk> chunks, SysFile sysFile) {
        String newFilePath = CommonConstants.FILE_SYSTEM + fileName;
        if (!new File(newFilePath).exists()) {
            Files.createFile(Paths.get(newFilePath));
        }
        //合并文件
        for (Chunk chunk : chunks) {
            String path = CommonConstants.FILE_SYSTEM + chunk.getIdentifier() + StrUtil.UNDERLINE + chunk.getChunkNumber();
            Files.write(Paths.get(newFilePath), Files.readAllBytes(Paths.get(path)), StandardOpenOption.APPEND);
            Files.delete(Paths.get(path));
        }
        //上传原始文件
        minioTemplate.putObject(CommonConstants.BUCKET_NAME, fileName, new FileInputStream(new File(newFilePath)));

        //支持转码
        if(ArrayUtil.contains(FileContants.ALLOW_TRANSFER_PDF,FileContants.getFileType(fileName))) {
            File sourceFile = new File(newFilePath);
            String filename = FileUtil.getName(sourceFile)
                    .replace(FileUtil.extName(sourceFile), PDF);

            File file = new File(sourceFile.getParent() + StrUtil.SLASH + filename);
            converter.convert(sourceFile)
                    .to(file)
                    .execute();
            sysFile.setTransPath(file.getName());
            this.sysFileService.updateById(sysFile);
            minioTemplate.putObject(CommonConstants.BUCKET_NAME, file.getName(), new FileInputStream(file));
            file.delete();
        }
        new File(newFilePath).delete();

    }


}
