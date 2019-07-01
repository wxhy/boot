package com.study.boot.upms.web;

import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysDept;
import com.study.boot.upms.service.SysDeptService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/dept")
@AllArgsConstructor
@Api(tags = "部门管理模块")
public class DeptController {

    private final SysDeptService sysDeptService;

    /**
     * 获取部门树
     * @return
     */
    @GetMapping("/tree")
    public WebResponse listDeptTrees(){
        return WebResponse.builder().data(sysDeptService.listDeptTrees()).build();
    }

    /**
     * 返回当前用户树形菜单集合
     *
     * @return 树形菜单
     */
    @GetMapping(value = "/user-tree")
    public WebResponse listCurrentUserDeptTrees() {
        return new WebResponse<>(sysDeptService.listCurrentUserDeptTrees());
    }

    /**
     * 获取部门详情
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getDeptDetail(@PathVariable Integer id) {
        return new WebResponse<>(sysDeptService.getById(id));
    }

    /**
     * 保存部门信息
     * @param sysDept
     * @return
     */
    @PostMapping
    @SysLog("添加部门")
    @PreAuthorize("@pms.hasPermission('sys_dept_add')")
    public WebResponse saveDept(@Valid @RequestBody SysDept sysDept) {
        return new WebResponse<>(sysDeptService.save(sysDept));
    }

    /**
     * 修改部门信息
     * @param sysDept
     * @return
     */
    @PutMapping
    @SysLog("修改部门")
    @PreAuthorize("@pms.hasPermission('sys_dept_edit')")
    public WebResponse updateDept(@Valid @RequestBody SysDept sysDept) {
        return new WebResponse<>(sysDeptService.updateDeptById(sysDept));
    }

    /**
     * 删除部门信息
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @SysLog("删除部门")
    @PreAuthorize("@pms.hasPermission('sys_dept_del')")
    public WebResponse removeDept(@PathVariable Integer id) {
        return new WebResponse<>(sysDeptService.removeDeptById(id));
    }

}
