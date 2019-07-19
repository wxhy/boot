package com.study.boot.pan.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.oss.service.MinioTemplate;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.SysFile;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.mapper.VirtualAddressMapper;
import com.study.boot.pan.service.SysFileService;
import com.study.boot.pan.service.VirtualAddressService;
import com.study.boot.pan.vo.FileDetailVo;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
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


}
