package com.study.boot.pay.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.pay.mapper.PayInfoMapper;
import com.study.boot.pay.entitiy.PayInfo;
import com.study.boot.pay.service.PayInfoService;
/**
 * @author Administrator
 */
@Service
public class PayInfoServiceImpl extends ServiceImpl<PayInfoMapper, PayInfo> implements PayInfoService{

    @Override
    public Boolean start() {


        return null;
    }
}
