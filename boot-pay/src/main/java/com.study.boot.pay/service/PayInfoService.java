package com.study.boot.pay.service;

import com.alipay.api.response.AlipayTradePagePayResponse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.pay.entitiy.PayInfo;

/**
 * @author Administrator
 */
public interface PayInfoService extends IService<PayInfo>{

    /**
     * 电脑端支付
     * @param payInfo
     * @return
     * @throws Exception
     */
    AlipayTradePagePayResponse payTrage(PayInfo payInfo) throws Exception;

}
