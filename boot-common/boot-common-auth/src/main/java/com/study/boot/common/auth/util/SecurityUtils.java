package com.study.boot.common.auth.util;

import cn.hutool.core.util.StrUtil;
import com.study.boot.common.constants.SecurityConstants;
import lombok.experimental.UtilityClass;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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

    /**
     * 获取用户角色信息
     * @return
     */
    public List<Integer> getRoleIds(){
        Authentication authentication = getAuthentication();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        List<Integer> roleIds = new ArrayList<>();
        authorities.stream()
                .filter(granted-> StrUtil.startWith(granted.getAuthority(), SecurityConstants.ROLE))
                .forEach(granted->{
                    String id = StrUtil.removePrefix(granted.getAuthority(), SecurityConstants.ROLE);
                    roleIds.add(Integer.parseInt(id));
                });
        return roleIds;
    }
}
