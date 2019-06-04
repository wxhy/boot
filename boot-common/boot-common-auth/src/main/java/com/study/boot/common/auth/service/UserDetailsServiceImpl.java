package com.study.boot.common.auth.service;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 *  用户详细信息
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class UserDetailsServiceImpl implements CustomUserDetailsService {

    private final RemoteUserService remoteUserService;

    /**
     * 用户密码登录
     *
     * @param username 用户名
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    @SneakyThrows
    public UserDetails loadUserByUsername(String username) {
        WebResponse<UserInfo> info = remoteUserService.info(username, SecurityConstants.FROM_IN);
        UserDetails userDetails = getUserDetails(info);
        return userDetails;
    }

    /**
     * 社交账号登陆
     * @param instr type@code
     * @return
     */
    @Override
    @SneakyThrows
    public UserDetails loadUserBySocial(String instr) {
        return getUserDetails(remoteUserService.social(instr,SecurityConstants.FROM_IN));
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
