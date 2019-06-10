package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.service.SysMessageService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/message")
@AllArgsConstructor
public class MessageController {

    private final SysMessageService sysMessageService;


    @GetMapping("/page")
    public WebResponse getMessagePage(Page page){
        return new WebResponse<>(sysMessageService.page(page, Wrappers.emptyWrapper()));
    }
}
