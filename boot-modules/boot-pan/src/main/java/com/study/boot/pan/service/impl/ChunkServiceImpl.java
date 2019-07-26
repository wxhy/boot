package com.study.boot.pan.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.oss.service.MinioTemplate;
import com.study.boot.pan.entity.Chunk;
import com.study.boot.pan.entity.SysFile;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.mapper.ChunkMapper;
import com.study.boot.pan.service.ChunkService;
import com.study.boot.pan.service.SysFileService;
import com.study.boot.pan.service.VirtualAddressService;
import com.study.boot.pan.vo.ChunkResult;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * @author carlos
 */
@Service
public class ChunkServiceImpl extends ServiceImpl<ChunkMapper, Chunk> implements ChunkService {

    @Autowired
    private MinioTemplate minioTemplate;

    @Autowired
    private SysFileService sysFileService;

    @Autowired
    private VirtualAddressService virtualAddressService;

    /**
     * 上传chunk
     *
     * @param chunk
     * @return
     */
    @Override
    @SneakyThrows
    @Transactional(rollbackFor = Exception.class)
    public Boolean uploadChunk(Chunk chunk) {
        this.baseMapper.insert(chunk);
        String path = CommonConstants.FILE_SYSTEM + chunk.getIdentifier() + StrUtil.UNDERLINE + chunk.getChunkNumber();
        File file = new File(path);
        IoUtil.copy(chunk.getFile().getInputStream(), new FileOutputStream(file));
        return Boolean.TRUE;
    }

    /**
     * 合并
     *
     * @param md5
     * @return
     */
    @Override
    @SneakyThrows
    @Transactional(rollbackFor = Exception.class)
    public Boolean mergeChunk(String md5, Long parentId, String name) {
        SysFile sysFile = sysFileService.getOne(Wrappers.<SysFile>query().lambda()
                .eq(SysFile::getMd5, md5));

        VirtualAddress virtualAddress = new VirtualAddress();
        //检查是否存在同名文件
        name = this.virtualAddressService.checkExist(name, FileContants.getFileType(name), parentId);
        virtualAddress.setFileName(name);
        virtualAddress.setMd5(md5);
        virtualAddress.setParentId(parentId);
        virtualAddress.setType(FileContants.getFileType(name).toString());

        if (sysFile != null) {
            virtualAddress.setFileId(sysFile.getFileId());
            this.virtualAddressService.save(virtualAddress);
            return Boolean.TRUE;
        }


        List<Chunk> chunks = this.baseMapper.selectList(Wrappers.<Chunk>query().lambda()
                .eq(Chunk::getIdentifier, md5)
                .orderByAsc(Chunk::getChunkNumber));
        Chunk chunkFirst = chunks.get(0);
        String fileName = md5 + StrUtil.DOT + FileUtil.extName(chunkFirst.getFilename());


        //需要合并
        sysFile = new SysFile();
        sysFile.setFileId(UUID.randomUUID().toString());
        sysFile.setFileSize(chunkFirst.getTotalSize());
        sysFile.setMd5(md5);
        sysFile.setFilePath(fileName);
        sysFile.setStatus(CommonConstants.STATUS_NORMAL);
        this.sysFileService.save(sysFile);
        virtualAddress.setFileId(sysFile.getFileId());
        this.virtualAddressService.save(virtualAddress);

        //合并文件，转码
        this.virtualAddressService.transferPdf(fileName,chunks,sysFile);


        return Boolean.TRUE;
    }

    /**
     * 检查chunk
     *
     * @param chunk
     * @return
     */
    @Override
    public ChunkResult checkChunk(Chunk chunk) {
        SysFile sysFile = sysFileService.getOne(Wrappers.<SysFile>query().lambda()
                .eq(SysFile::getMd5, chunk.getIdentifier()));
        if (sysFile != null) {
            return ChunkResult.builder().skipUpload(true).build();
        }
        List<Long> results = this.baseMapper.selectList(Wrappers.<Chunk>query().lambda()
                .eq(Chunk::getIdentifier, chunk.getIdentifier()))
                .stream()
                .map(Chunk::getChunkNumber)
                .collect(Collectors.toList());

        return ChunkResult.builder().uploaded(results.toArray(new Long[0])).build();
    }




}
