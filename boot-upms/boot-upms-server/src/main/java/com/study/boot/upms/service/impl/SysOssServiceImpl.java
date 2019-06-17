package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.oss.service.OssTemplate;
import com.study.boot.upms.api.entity.SysOss;
import com.study.boot.upms.mapper.SysOssMapper;
import com.study.boot.upms.service.SysOssService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Administrator
 */
@Service
public class SysOssServiceImpl extends ServiceImpl<SysOssMapper, SysOss> implements SysOssService {

    @Autowired
    private OssTemplate ossTemplate;

    /**
     * 删除文件
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @SneakyThrows
    public Boolean removeOssById(Integer id) {
        return null;
    }
}
