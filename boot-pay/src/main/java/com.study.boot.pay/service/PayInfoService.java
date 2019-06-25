package com.study.boot.pay.service;

import com.study.boot.pay.entitiy.PayInfo;
import com.baomidou.mybatisplus.extension.service.IService;
public interface PayInfoService extends IService<PayInfo>{


    Boolean start();


}
