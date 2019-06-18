package com.study.boot.upms.web;

import cn.hutool.core.io.IoUtil;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.service.SysOssService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/file")
@Slf4j
@AllArgsConstructor
public class FileController {

    private final SysOssService sysOssService;
    /**
     *  上传文件
     *  文件名采用uuid,避免原始文件名中带"-"符号导致下载的时候解析出现异常
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public WebResponse uploadFile(@RequestParam("file") MultipartFile file) {
        String result = sysOssService.saveOss(file);
        return new WebResponse<>(result);
    }

    /**
     * 显示图片
     * @param fileName
     * @param response
     */
    @GetMapping("/{fileName}")
    public void file(@PathVariable String fileName, HttpServletResponse response) {
        try(InputStream inputStream = sysOssService.getOssInputStream(fileName)) {
            response.setContentType("application/octet-stream; charset=UTF-8");
            IoUtil.copy(inputStream, response.getOutputStream());
        }catch (Exception e) {
            log.error("文件读取异常", e);
        }
    }




}
