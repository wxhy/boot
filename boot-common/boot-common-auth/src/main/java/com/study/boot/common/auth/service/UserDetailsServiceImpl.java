package com.study.boot.common.auth.service;

import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *  用户详细信息
 * @author Administrator
 */
@Service
@Slf4j
@Primary
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private RemoteUserService remoteUserService;

    /**
     * 用户密码登录
     *
     * @param username 用户名
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        WebResponse<UserInfo> info = remoteUserService.info(username, SecurityConstants.FROM_IN);
        UserDetails userDetails = getUserDetails(info.getData());
        return userDetails;
    }

    private UserDetails getUserDetails(UserInfo info) {

        //TODO
        return new CustomUser(1,1,"","",true,true,true,true,null);

    }
}
