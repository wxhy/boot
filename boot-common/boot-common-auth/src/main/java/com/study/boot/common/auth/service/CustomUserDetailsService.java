package com.study.boot.common.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @author Administrator
 */
public interface CustomUserDetailsService extends UserDetailsService {

    /**
     * 根据社交账号code登录
     * @param code TYPE@CODE
     * @return
     * @throws UsernameNotFoundException
     */
    UserDetails loadUserBySocial(String code) throws UsernameNotFoundException;
}
