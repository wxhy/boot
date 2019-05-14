package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private SysUserService sysUserService;

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
        return new WebResponse<>(CommonConstants.SUCCESS, user);
    }
}
