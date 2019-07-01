package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysOss;
import com.study.boot.upms.service.SysOssService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    /**
     *
     * @param page
     * @param sysOss
     * @return
     */
    @RequestMapping("/page")
    public WebResponse getOssPage(Page page, SysOss sysOss) {
        return new WebResponse<>(sysOssService.page(page, Wrappers.query(sysOss).orderByDesc(SysOss.COL_CREATE_TIME)));
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
