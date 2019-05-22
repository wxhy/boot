package com.study.boot.common.auth.util;

import com.study.boot.common.auth.service.CustomUser;
import lombok.experimental.UtilityClass;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 安全工具类
 * @author Administrator
 */
@UtilityClass
public class SecurityUtils {

    /**
     * 获取Authentication
     * @return
     */
    public static Authentication getAuthentication(){
        return SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * 获取当前登录用户名称
     * @param authentication
     * @return
     */
    public String getUserName(Authentication authentication){
        Object principal = authentication.getPrincipal();
        if(principal instanceof  String) {
            return (String) principal;
        }
        return null;
    }

    /**
     * 获取当前登录用户名称
     * @return
     */
    public String getUserName(){
        Authentication authentication = getAuthentication();
        if(authentication == null) {
            return null;
        }
        return getUserName(authentication);
    }
}
