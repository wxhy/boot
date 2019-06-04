package com.study.boot.upms.handler;


import com.study.boot.upms.api.dto.UserInfo;

/**
 *
 * @author Administrator
 */
public abstract class AbstractLoginHandler implements LoginHandler {

    /**
     * 处理方法
     *
     * @param loginStr 登录参数
     * @return
     */
    @Override
    public UserInfo handle(String loginStr) {
        String identify = identify(loginStr);
        return info(identify);
    }
}
