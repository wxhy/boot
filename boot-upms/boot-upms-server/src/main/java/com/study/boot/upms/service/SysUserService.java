package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;

/**
 * @author Administrator
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 查询用户信息
     *
     * @param sysUser 用户
     * @return userInfo
     */
    UserInfo getUserInfo(SysUser sysUser);


}








