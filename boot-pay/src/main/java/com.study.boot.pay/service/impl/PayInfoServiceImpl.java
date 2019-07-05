package com.study.boot.pay.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.pay.config.AlipayConfig;
import com.study.boot.pay.entitiy.PayInfo;
import com.study.boot.pay.mapper.PayInfoMapper;
import com.study.boot.pay.service.PayInfoService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 */
@Service
public class PayInfoServiceImpl extends ServiceImpl<PayInfoMapper, PayInfo> implements PayInfoService{

    @Autowired
    private AlipayClient alipayClient;

    @Autowired
    private AlipayConfig alipayConfig;

    @Override
    @SneakyThrows
    public AlipayTradePagePayResponse payTrage(PayInfo payInfo) {
        Snowflake snowflake = IdUtil.createSnowflake(1, 1);
        long goodNo = snowflake.nextId();
        PayInfo info = new PayInfo();
        BeanUtil.copyProperties(payInfo,info);
        info.setProductNo(String.valueOf(goodNo));
        this.baseMapper.insert(info);

        JSONObject data=new JSONObject();
        data.put("out_trade_no",goodNo);
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

        return alipayClient.pageExecute(alipayRequest);

    }
}
