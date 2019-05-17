package com.study.boot.common.auth.service;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.feign.RemoteUserService;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 *  用户详细信息
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final RemoteUserService remoteUserService;

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
        UserDetails userDetails = getUserDetails(info);
        return userDetails;
    }

    private UserDetails getUserDetails( WebResponse<UserInfo> result) {
        if(result == null || result.getData() == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

        UserInfo info = result.getData();
        Set<String> dbAuthSet = new HashSet<>();


        if(ArrayUtil.isNotEmpty(info.getRoles())) {
            //获取角色
            Arrays.stream(info.getRoles()).forEach(role-> dbAuthSet.add(SecurityConstants.ROLE + role));
            //获取权限
            dbAuthSet.addAll(Arrays.asList(info.getPermissions()));
        }
        Collection<?extends GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(dbAuthSet.toArray(new String[0]));

        SysUser user = info.getSysUser();

        //构建security用户
        return new CustomUser(user.getUserId(),user.getDeptId(),user.getUsername(),SecurityConstants.BCRYPT + user.getPassword(),
                StrUtil.equals(user.getLockFlag(), CommonConstants.STATUS_NORMAL),true,true,true,authorities);

    }
}
