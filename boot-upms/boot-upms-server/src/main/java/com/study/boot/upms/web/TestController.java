package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
@AllArgsConstructor
public class TestController {

    private final SysUserService sysUserService;

    @GetMapping("/user")
    public WebResponse testUser(){
        return new WebResponse<>(sysUserService.getOne(Wrappers.<SysUser>query().
                lambda().eq(SysUser::getUsername, "admin")));
    }
}
