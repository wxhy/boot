package com.study.boot.upms.web;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.oss.config.QiniuProperties;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysOss;
import com.study.boot.upms.api.vo.SysOssVo;
import com.study.boot.upms.service.SysOssService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Administrator
 */

@RestController
@RequestMapping("/oss")
@AllArgsConstructor
@Api(tags = "OSS文件管理")
public class OssController {

    private final SysOssService sysOssService;
    private final QiniuProperties qiniuProperties;
    /**
     *
     * @param page
     * @param sysOss
     * @return
     */
    @GetMapping("/page")
    public WebResponse getOssPage(Page page, SysOss sysOss) {
        IPage result = sysOssService.page(page, Wrappers.query(sysOss).orderByDesc(SysOss.COL_CREATE_TIME));
        List<SysOss> records = result.getRecords();

        List<SysOssVo> resultList = records.stream().map(oss -> {
            SysOssVo sysOssVo = new SysOssVo();
            BeanUtil.copyProperties(oss, sysOssVo);
            sysOssVo.setUrl(qiniuProperties.getPath() + sysOssVo.getFkey());
            return sysOssVo;
        }).collect(Collectors.toList());

        result.setRecords(resultList);
        return new WebResponse<>(result);
    }

    /**
     * 删除文件
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public WebResponse removeOssById(@PathVariable Integer id) {
        return new WebResponse<>(sysOssService.removeById(id));
    }

    @DeleteMapping("/removeBatch/{idList}")
    public WebResponse removeBatch(@PathVariable String idList){
        return new WebResponse(this.sysOssService.removeOssBatch(idList));
    }
}
