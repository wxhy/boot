package com.study.boot.pay.web;


import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pay.entitiy.PayInfo;
import com.study.boot.pay.service.PayInfoService;
import io.swagger.annotations.Api;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/pay")
@Slf4j
@Api(tags = "支付模块")
public class PayController {

    @Autowired
    private PayInfoService payInfoService;


    @GetMapping("/page")
    public WebResponse page(Page page, PayInfo payInfo){
        return new WebResponse<>(payInfoService.page(page, Wrappers.query(payInfo)));
    }

    /**
     * 电脑端支付
     * @param response
     */
    @PostMapping("/payTrage")
    @SneakyThrows
    public void payTrage(@RequestBody PayInfo payInfo, HttpServletResponse response){
        AlipayTradePagePayResponse payResponse = payInfoService.payTrage(payInfo);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(payResponse.getBody());
    }


}
