package com.study.boot.upms.handler;


import com.study.boot.upms.api.dto.UserInfo;

/**
 * 登录处理器
 * @author Administrator
 */
public interface LoginHandler {

    /**
     * 通过用户传入获取唯一标识
     *
     * @param loginStr
     * @return
     */
    String identify(String loginStr);

    /**
     * 通过openId 获取用户信息
     *
     * @param identify
     * @return
     */
    UserInfo info(String identify);

    /**
     * 处理方法
     *
     * @param loginStr 登录参数
     * @return
     */
    UserInfo handle(String loginStr);
}
