package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.mapper.SysUserMapper;
import com.study.boot.upms.service.SysUserService;
import org.springframework.stereotype.Service;

/**
 * @author Administrator
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Override
    public UserInfo getUserInfo(SysUser sysUser) {
        return null;
    }
}








