package com.study.boot.upms.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.upms.api.dto.UserDTO;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.entity.SysUserRole;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.api.vo.UserVO;
import com.study.boot.upms.mapper.SysUserMapper;
import com.study.boot.upms.service.SysMenuService;
import com.study.boot.upms.service.SysRoleService;
import com.study.boot.upms.service.SysUserRoleService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    private static final PasswordEncoder ENCODER = new BCryptPasswordEncoder();
    private final SysMenuService sysMenuService;
    private final SysRoleService sysRoleService;
    private final SysUserRoleService sysUserRoleService;

    /**
     * 获取用户全部信息（角色、权限）
     * @param sysUser 用户
     * @return
     */
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

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveUser(UserDTO userDTO) {
        SysUser user = new SysUser();
        BeanUtil.copyProperties(userDTO,user);
        user.setDelFlag(CommonConstants.STATUS_NORMAL);
        user.setPassword(ENCODER.encode(userDTO.getPassword()));
        baseMapper.insert(user);
        List<SysUserRole> userRoles = userDTO.getRole().stream()
                .map(roleId -> {
                    SysUserRole userRole = new SysUserRole();
                    userRole.setRoleId(roleId);
                    userRole.setUserId(user.getUserId());
                    return userRole;
                }).collect(Collectors.toList());
        return sysUserRoleService.saveBatch(userRoles);
    }

    /**
     * 修改会员个人信息
     * @param userDto
     * @return
     */
    @Override
    public Boolean updateUserInfo(UserDTO userDto) {
        UserVO userVO = baseMapper.getUserVoByUsername(userDto.getUsername());
        SysUser sysUser = new SysUser();
        if (StrUtil.isNotBlank(userDto.getPassword())
                && StrUtil.isNotBlank(userDto.getNewpassword())) {
            if (ENCODER.matches(userDto.getPassword(), userVO.getPassword())) {
                sysUser.setPassword(ENCODER.encode(userDto.getNewpassword()));
            } else {
                log.warn("原密码错误，修改密码失败:{}", userDto.getUsername());
                return Boolean.FALSE;
            }
        }
        sysUser.setPhone(userDto.getPhone());
        sysUser.setUserId(userVO.getUserId());
        sysUser.setAvatar(userDto.getAvatar());
        return Boolean.TRUE;
    }

    /**
     * 修改用户信息
     * @param userDTO
     * @return
     */
    @Override
    public Boolean updateUser(UserDTO userDTO) {
        SysUser sysUser = new SysUser();
        BeanUtil.copyProperties(userDTO,sysUser);
        sysUser.setUpdateTime(LocalDateTime.now());
        if(StrUtil.isNotBlank(userDTO.getPassword())) {
            sysUser.setPassword(ENCODER.encode(userDTO.getPassword()));
        }
        this.updateById(sysUser);

        //重置角色
        sysUserRoleService.removeRoleByUserId(sysUser.getUserId());
        List<SysUserRole> userRoles = userDTO.getRole().stream().map(roleId -> {
            SysUserRole userRole = new SysUserRole();
            userRole.setUserId(sysUser.getUserId());
            userRole.setRoleId(roleId);
            return userRole;
        }).collect(Collectors.toList());

        return sysUserRoleService.saveBatch(userRoles);
    }


    @Override
    public Boolean removeUserById(SysUser user) {
        sysUserRoleService.removeRoleByUserId(user.getUserId());
        this.removeById(user.getUserId());
        return Boolean.TRUE;
    }

    /**
     * 分页查询会员信息（包括角色）
     * @param page    分页对象
     * @param userDTO 参数列表
     * @return
     */
    @Override
    public IPage getUserWithRolePage(Page page, UserDTO userDTO) {
        return this.baseMapper.getUserVosPage(page,userDTO);
    }

    /**
     * 根据会员名查询会员
     * @param username
     * @return
     */
    @Override
    public SysUser findByUsername(String username) {
        return baseMapper.selectOne(Wrappers.<SysUser>query()
                .lambda().eq(SysUser::getUsername, username));
    }
}








