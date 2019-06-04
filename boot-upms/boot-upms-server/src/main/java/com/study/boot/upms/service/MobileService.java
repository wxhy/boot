package com.study.boot.upms.service;

import com.study.boot.common.util.WebResponse;

public interface MobileService {

    /**
     * 发送短信
     * @param mobile
     * @return
     */
    WebResponse sendSmsCode(String mobile);
}
