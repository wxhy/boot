package com.study.boot.codegen.controller;

import cn.hutool.core.io.IoUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.codegen.entity.GenConfig;
import com.study.boot.codegen.service.SysGeneratorService;
import com.study.boot.common.util.WebResponse;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 */
@RestController
@AllArgsConstructor
@RequestMapping("/generator")
public class SysGeneratorController {

    private final SysGeneratorService sysGeneratorService;

    /**
     * 列表
     *
     * @param tableName 参数集
     * @return 数据库表
     */
    @GetMapping("/page")
    public WebResponse getPage(Page page, String tableName) {
        return new WebResponse<>(sysGeneratorService.getPage(page, tableName));
    }

    /**
     * 生成代码
     */
    @SneakyThrows
    @PostMapping("/code")
    public void generatorCode(@RequestBody GenConfig genConfig, HttpServletResponse response) {
        byte[] data = sysGeneratorService.generatorCode(genConfig);

        response.reset();
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.zip", genConfig.getTableName()));
        response.addHeader(HttpHeaders.CONTENT_LENGTH, String.valueOf(data.length));
        response.setContentType("application/octet-stream; charset=UTF-8");

        IoUtil.write(response.getOutputStream(), Boolean.TRUE, data);
    }
}
