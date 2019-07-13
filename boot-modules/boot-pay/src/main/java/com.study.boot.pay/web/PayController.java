package com.study.boot.pay.web;


import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.constants.CommonConstants;
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
import java.time.LocalDateTime;
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
    private AlipayConfig alipayConfig;

    @GetMapping("/page")
    public WebResponse page(Page page, PayInfo payInfo) {
        return new WebResponse<>(payInfoService.page(page, Wrappers.query(payInfo)));
    }

    /**
     * 电脑端支付
     *
     * @param response
     */
    @PostMapping("/payTrage")
    @SneakyThrows
    public void payTrage(@RequestBody PayInfo payInfo, HttpServletResponse response) {
        AlipayTradePagePayResponse payResponse = payInfoService.payTrage(payInfo);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(payResponse.getBody());
    }

    /**
     * 支付同步回调通知
     *
     * @param request
     * @return
     */
    @GetMapping("/notify")
    @SneakyThrows
    public WebResponse notify(HttpServletRequest request) {
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<>(16);
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //调用SDK验证签名
        boolean signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), alipayConfig.getCharset(), alipayConfig.getSignType());

        if (signVerified) {
            //商户订单号
            String outTradeNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //支付宝交易号
            String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //付款金额
            String totalAmount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            PayInfo payInfo = payInfoService.getOne(Wrappers.<PayInfo>query().lambda().eq(PayInfo::getProductNo, outTradeNo));
            payInfo.setUpdateTime(LocalDateTime.now());
            payInfo.setPayNo(tradeNo);
            payInfo.setStatus(CommonConstants.STATUS_DEL);
            this.payInfoService.updateById(payInfo);
            return new WebResponse<>(tradeNo,"支付成功");
        } else {
            return new WebResponse<>("支付失败");
        }
    }

}
