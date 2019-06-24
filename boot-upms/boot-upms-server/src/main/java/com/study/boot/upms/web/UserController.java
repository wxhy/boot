package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserDTO;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysUserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/user")
@Api(value="user",description = "用户管理模块")
public class UserController {

    @Autowired
    private SysUserService sysUserService;

    /**
     * 获取当前会员信息
     * @return
     */
    @GetMapping("/info")
    public WebResponse info(){
        String username = SecurityUtils.getUserName();
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query().
                lambda().eq(SysUser::getUsername, username));
        if(user == null) {
            return new WebResponse<>(CommonConstants.FAIL,"获取当前用户信息失败");
        }
        return new WebResponse<>(sysUserService.getUserInfo(user));
    }

    /**
     *  获取指定用户全部信息
     * @param username 会员名称
     * @return 用户信息
     */
    @GetMapping("/info/{username}")
    public WebResponse info(@PathVariable String username) {
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query().
                lambda().eq(SysUser::getUsername, username));

        if(user == null) {
            return new WebResponse<>(CommonConstants.FAIL,String.format("用户名%s不存在",username));
        }
        return new WebResponse<>(CommonConstants.SUCCESS, sysUserService.getUserInfo(user));
    }


    /**
     * 保存会员信息
     * @param userDTO
     * @return
     */
    @PostMapping
    @SysLog("添加会员")
    @PreAuthorize("@pms.hasPermission('sys_user_add')")
    public WebResponse add(@RequestBody UserDTO userDTO){
        return new WebResponse<>(sysUserService.saveUser(userDTO));
    }

    /**
     * 修改会员信息
     * @param userDTO
     * @return
     */
    @PutMapping
    @SysLog("修改会员")
    @PreAuthorize("@pms.hasPermission('sys_user_edit')")
    public WebResponse updateUser(@RequestBody @Valid UserDTO userDTO){
        return new WebResponse<>(sysUserService.updateUser(userDTO));
    }

    @PutMapping("/edit")
    @SysLog("修改会员个人信息")
    public WebResponse updateUserInfo(@RequestBody @Valid UserDTO userDTO) {
        return new WebResponse<>(sysUserService.updateUserInfo(userDTO));
    }

    @DeleteMapping("/{id}")
    @SysLog("删除会员")
    @PreAuthorize("@pms.hasPermission('sys_user_del')")
    public WebResponse userDel(@PathVariable Integer id) {
        SysUser user = sysUserService.getById(id);
        return new WebResponse<>(sysUserService.removeUserById(user));
    }

    /**
     * 分页查询用户
     *
     * @param page    参数集
     * @param userDTO 查询参数列表
     * @return 用户集合
     */
    @GetMapping("/page")
    public WebResponse getUserPage(Page page,UserDTO userDTO){
        return new WebResponse<>(sysUserService.getUserWithRolePage(page, userDTO));
    }


    /**
     * 根据用户名获取用户信息
     * @param username
     * @return
     */
    @GetMapping("/details/{username}")
    public WebResponse user(@PathVariable String username) {
        SysUser condition = new SysUser();
        condition.setUsername(username);
        return new WebResponse<>( sysUserService.getOne(new QueryWrapper<>(condition)));
    }

    /**
     * @param username 用户名称
     * @return 上级部门用户列表
     */
    @GetMapping("/ancestor/{username}")
    public WebResponse listAncestorUsers(@PathVariable String username) {
        return new WebResponse<>(sysUserService.listAncestorUsers(username));
    }

}
