package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.dto.DeptTree;
import com.study.boot.upms.api.entity.SysDept;

import java.util.List;

/**
 * @author Administrator
 */
public interface SysDeptService extends IService<SysDept> {

    /**
     * 查询部门树菜单
     *
     * @return 树
     */
    List<DeptTree> listDeptTrees();

    /**
     * 查询用户部门树
     *
     * @return
     */
    List<DeptTree> listCurrentUserDeptTrees();

    /**
     * 根据部门ID删除部门
     * @param id
     * @return
     */
    Boolean removeDeptById(Integer id);

    /**
     * 添加信息部门
     *
     * @param sysDept
     * @return
     */
    Boolean saveDept(SysDept sysDept);


    /**
     * 更新部门
     *
     * @param sysDept 部门信息
     * @return 成功、失败
     */
    Boolean updateDeptById(SysDept sysDept);

}

