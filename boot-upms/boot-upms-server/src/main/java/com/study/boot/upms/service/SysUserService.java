package com.study.boot.upms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.dto.UserDTO;
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

    /**
     * 保存用户信息
     * @param userDTO 会员DTO
     * @return 执行结果
     */
    Boolean saveUser(UserDTO userDTO);

    /**
     * 修改会员个人信息
     * @param userDTO
     * @return
     */
    Boolean updateUserInfo(UserDTO userDTO);

    /**
     * 修改用户信息
     * @param userDTO
     * @return
     */
    Boolean updateUser(UserDTO userDTO);

    /**
     * 删除用户
     * @param user 会员
     * @return 执行结果
     */
    Boolean removeUserById(SysUser user);


    /**
     * 分页查询用户信息（含有角色信息）
     *
     * @param page    分页对象
     * @param userDTO 参数列表
     * @return
     */
    IPage getUserWithRolePage(Page page, UserDTO userDTO);

    /**
     * 根据会员名查询会员
     * @param username
     * @return
     */
    SysUser findByUsername(String username);

}








