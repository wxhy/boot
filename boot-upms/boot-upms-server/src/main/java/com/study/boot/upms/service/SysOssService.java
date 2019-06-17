package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysOss;

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
}