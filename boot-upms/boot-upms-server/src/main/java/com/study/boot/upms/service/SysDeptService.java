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

}

