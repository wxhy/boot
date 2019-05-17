package com.study.boot.upms.service.impl;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.mapper.SysUserMapper;
import com.study.boot.upms.service.SysMenuService;
import com.study.boot.upms.service.SysRoleService;
import com.study.boot.upms.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Autowired
    private SysMenuService sysMenuService;


    @Autowired
    private SysRoleService sysRoleService;

    @Override
    public UserInfo getUserInfo(SysUser sysUser) {
        UserInfo userInfo = new UserInfo();
        userInfo.setSysUser(sysUser);

        //设置角色列表  （ID）
        List<Integer> roleIds =  sysRoleService.listRolesByUserId(sysUser.getUserId())
                .parallelStream()
                .map(SysRole::getRoleId)
                .collect(Collectors.toList());
        userInfo.setRoles(ArrayUtil.toArray(roleIds,Integer.class));

        //获取权限列表(menu.permission)
        Set<String> permissions = new HashSet<>();
        roleIds.parallelStream().forEach(roleId->{
            List<String> permissionList = sysMenuService.getMenuByRoleId(roleId)
                    .stream()
                    .map(MenuVO::getPermission)
                    .filter(StrUtil::isNotEmpty)
                    .collect(Collectors.toList());
            permissions.addAll(permissionList);
        });

        userInfo.setPermissions(ArrayUtil.toArray(permissions,String.class));
        return userInfo;
    }
}








