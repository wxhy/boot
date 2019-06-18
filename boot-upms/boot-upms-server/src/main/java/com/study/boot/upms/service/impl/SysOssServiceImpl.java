package com.study.boot.upms.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.service.OssTemplate;
import com.study.boot.common.oss.vo.QiniuResult;
import com.study.boot.upms.api.entity.SysOss;
import com.study.boot.upms.mapper.SysOssMapper;
import com.study.boot.upms.service.SysOssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
    public Boolean removeOssById(Integer id) {
        SysOss sysOss = this.baseMapper.selectById(id);
        if(ossTemplate.removeObject(sysOss.getFkey())){
            this.baseMapper.deleteById(id);
        }
        return Boolean.FALSE;
    }

    @Override
    public Boolean copyOssById(Integer id) {
        SysOss sysOss = this.baseMapper.selectById(id);
        String fileName = IdUtil.simpleUUID()+ StrUtil.DOT+ FileUtil.extName(sysOss.getName());
        if(ossTemplate.copyObject(sysOss.getFkey(),fileName)){
            SysOss oss = new SysOss();
            oss.setCrateBy(SecurityUtils.getUserName());
            oss.setFkey(fileName);
            oss.setName(sysOss.getName());
            oss.setFileSize(sysOss.getFileSize());
            oss.setType(sysOss.getType());
            this.baseMapper.insert(oss);
        }
        return Boolean.TRUE;
    }

    @Override
    public Integer removeOssBatch(String idList) {
        String[] split = idList.split("-");
        List<String> keys = Arrays.stream(split)
                .map(id -> {
                    SysOss sysOss = this.baseMapper.selectById(id);
                    return sysOss.getFkey();
                }).collect(Collectors.toList());
        List<String> results = ossTemplate.removeBatch(keys.toArray(new String[0]));
        List<Integer> ids = this.baseMapper.selectList(Wrappers.<SysOss>query()
                .lambda().in(SysOss::getFkey, results))
                .stream()
                .map(oss -> oss.getId())
                .collect(Collectors.toList());
        this.baseMapper.deleteBatchIds(ids);
        return results.size();
    }

    @Override
    public String saveOss(MultipartFile file) {
        String fileName = IdUtil.simpleUUID()+ StrUtil.DOT+ FileUtil.extName(file.getOriginalFilename());
        QiniuResult result = ossTemplate.createObject(file, fileName);
        SysOss sysOss = new SysOss();
        BeanUtil.copyProperties(result, sysOss);
        sysOss.setName(file.getOriginalFilename());
        sysOss.setCrateBy(SecurityUtils.getUserName());
        sysOss.setDelflag(CommonConstants.STATUS_NORMAL);
        sysOss.setUpdateBy(SecurityUtils.getUserName());
        this.baseMapper.insert(sysOss);
        return fileName;
    }

    @Override
    public InputStream getOssInputStream(String key) {
        return ossTemplate.getObject(key);
    }
}
