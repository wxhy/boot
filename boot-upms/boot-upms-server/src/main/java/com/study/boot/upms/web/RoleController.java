package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.service.SysRoleService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/role")
@AllArgsConstructor
public class RoleController {

    private final SysRoleService sysRoleService;

    @GetMapping("/list")
    public WebResponse listRoles(){
        List<SysRole> roles = sysRoleService.list(Wrappers.emptyWrapper());
        return new WebResponse<>(roles);
    }
}
