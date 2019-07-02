package com.study.boot.pay.web;


import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pay.config.AlipayConfig;
import com.study.boot.pay.entitiy.PayInfo;
import com.study.boot.pay.service.PayInfoService;
import io.swagger.annotations.Api;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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

    @Autowired
    private AlipayClient alipayClient;

    @Autowired
    private AlipayConfig alipayConfig;


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
        JSONObject data=new JSONObject();
        Snowflake snowflake = IdUtil.createSnowflake(1, 1);
        data.put("out_trade_no",snowflake.nextId());
        //电脑支付
        data.put("product_code","FAST_INSTANT_TRADE_PAY");
        data.put("total_amount",payInfo.getMoney());
        data.put("subject",payInfo.getName());
        data.put("body",payInfo.getRemark());
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setBizContent(data.toJSONString(0));
        alipayRequest.setNotifyUrl(alipayConfig.getNotifyUrl());
        alipayRequest.setReturnUrl(alipayConfig.getReturnUrl());

        AlipayTradePagePayResponse payResponse = alipayClient.pageExecute(alipayRequest);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(payResponse.getBody());
    }

    @PostMapping("/notify")
    @SneakyThrows
    public void notify(HttpServletRequest request) {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), alipayConfig.getCharset(), alipayConfig.getSignType());
        if (signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
            log.info("支付状态：" + trade_status);
            if (trade_status.equals("TRADE_FINISHED")) {

            } else if (trade_status.equals("TRADE_SUCCESS")) {
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }

        }
    }

}
