package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.service.SysRoleMenuService;
import com.study.boot.upms.service.SysRoleService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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
    private final SysRoleMenuService sysRoleMenuService;

    /**
     * 获取角色列表
     * @return
     */
    @GetMapping("/list")
    public WebResponse listRoles(){
        List<SysRole> roles = sysRoleService.list(Wrappers.emptyWrapper());
        return new WebResponse<>(roles);
    }

    /**
     * 分页获取角色
     * @param page
     * @return
     */
    @GetMapping("/page")
    public WebResponse getRolePage(Page page){
        return new WebResponse<>(sysRoleService.page(page,Wrappers.emptyWrapper()));
    }

    /**
     * 获取角色信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getRoleById(@PathVariable Integer id){
        return new WebResponse<>(sysRoleService.getById(id));
    }


    /**
     * 保存角色信息
     * @param sysRole
     * @return
     */
    @PostMapping
    @SysLog("添加角色")
    public WebResponse saveRole(@Valid @RequestBody SysRole sysRole){
        return new WebResponse<>(sysRoleService.save(sysRole));
    }

    /***
     *  修改角色信息
     * @param sysRole
     * @return
     */
    @PutMapping
    @SysLog("修改角色")
    public WebResponse updateRole(@Valid @RequestBody SysRole sysRole) {
        return new WebResponse<>(sysRoleService.updateById(sysRole));
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @SysLog("删除角色")
    public WebResponse removeById(@PathVariable Integer id) {
        return new WebResponse<>(sysRoleService.removeRoleById(id));
    }

    /**
     *  更新角色菜单
     * @param roleId
     * @param menuIds
     * @return
     */
    @PutMapping("/menu")
    @SysLog("更新角色菜单")
    public WebResponse saveRoleMenus(Integer roleId,@RequestParam(value = "menuIds",required = false)String menuIds) {
        return new WebResponse<>(sysRoleMenuService.saveRoleMenus(roleId,menuIds));
    }

}
