package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysOss;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

/**
 * @author Administrator
 */
public interface SysOssService extends IService<SysOss> {

    /**
     * 删除文件
     * @param id
     * @return
     */
    Boolean removeOssById(Integer id);

    /**
     * 复制文件
     * @param id
     * @return
     */
    Boolean copyOssById(Integer id);

    /**
     * 批量删除文件
     * @param keys
     * @return
     */
    Integer removeOssBatch(String keys);

    /**
     * 保存文件
     * @param file
     * @return
     */
    String saveOss(MultipartFile file);

    /**
     * 获取图片流
     * @param key
     * @return
     */
    InputStream getOssInputStream(String key);
}