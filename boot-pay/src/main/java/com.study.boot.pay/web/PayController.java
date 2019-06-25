package com.study.boot.pay.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pay.entitiy.PayInfo;
import com.study.boot.pay.service.PayInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/pay")
public class PayController {

    @Autowired
    private PayInfoService payInfoService;

    @GetMapping("/page")
    public WebResponse page(Page page, PayInfo payInfo){
        return new WebResponse<>(payInfoService.page(page, Wrappers.query(payInfo)));
    }

    @GetMapping("/start")
    public WebResponse start(){

        return new WebResponse();
    }

}
