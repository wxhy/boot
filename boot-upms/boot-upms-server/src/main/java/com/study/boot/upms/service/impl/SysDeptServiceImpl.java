package com.study.boot.upms.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.upms.api.dto.DeptTree;
import com.study.boot.upms.api.entity.SysDept;
import com.study.boot.upms.api.entity.SysDeptRelation;
import com.study.boot.upms.api.util.TreeUtils;
import com.study.boot.upms.mapper.SysDeptMapper;
import com.study.boot.upms.service.SysDeptRelationService;
import com.study.boot.upms.service.SysDeptService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    private final SysDeptRelationService sysDeptRelationService;

    private final SysUserService sysUserService;

    /**
     * 查询部门树菜单
     *
     * @return 树
     */
    @Override
    public List<DeptTree> listDeptTrees() {
        List<DeptTree> trees = baseMapper.selectList(Wrappers.emptyWrapper())
                .stream().map(dept -> {
                    DeptTree dt = new DeptTree();
                    dt.setName(dept.getName());
                    dt.setId(dept.getDeptId());
                    dt.setParentId(dept.getParentId());
                    return dt;
                }).collect(Collectors.toList());
        return TreeUtils.buildByRecursive(trees,0);
    }

    /**
     * 查询用户部门树
     *
     * @return
     */
    @Override
    public List<DeptTree> listCurrentUserDeptTrees() {
        Integer deptId = sysUserService.findByUsername(SecurityUtils.getUserName()).getDeptId();
        List<Integer> descendantIdList = sysDeptRelationService
                .list(Wrappers.<SysDeptRelation>query().lambda()
                        .eq(SysDeptRelation::getAncestor, deptId))
                .stream().map(SysDeptRelation::getDescendant)
                .collect(Collectors.toList());

        List<SysDept> deptList = baseMapper.selectBatchIds(descendantIdList);
        return getDeptTree(deptList);
    }

    /**
     * 删除部门
     *
     * @param id 部门 ID
     * @return 成功、失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeDeptById(Integer id) {
        //级联删除部门
        List<Integer> idList = sysDeptRelationService.list(Wrappers.<SysDeptRelation>query()
                .lambda().eq(SysDeptRelation::getAncestor, id))
                .stream().map(SysDeptRelation::getDescendant)
                .collect(Collectors.toList());
        if(CollUtil.isNotEmpty(idList)){
            this.baseMapper.deleteBatchIds(idList);
        }

        //级联删除部门关系
        sysDeptRelationService.removeDeptRelationById(id);
        return Boolean.TRUE;
    }

    /**
     * 添加部门信息
     * @param dept
     * @return
     */
    @Override
    public Boolean saveDept(SysDept dept) {
        SysDept sysDept = new SysDept();
        BeanUtils.copyProperties(dept, sysDept);
        this.save(sysDept);
        sysDeptRelationService.saveDeptRelation(sysDept);
        return Boolean.TRUE;
    }

    /***
     * 更新部门信息
     * @param sysDept 部门信息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateDeptById(SysDept sysDept) {
        //更新部门状态
        this.updateById(sysDept);
        //更新部门关系
        SysDeptRelation relation = new SysDeptRelation();
        relation.setAncestor(sysDept.getParentId());
        relation.setDescendant(sysDept.getDeptId());
        sysDeptRelationService.updateDeptRelation(relation);
        return Boolean.TRUE;
    }

    /**
     * 构建部门树
     *
     * @param depts 部门
     * @return
     */
    private List<DeptTree> getDeptTree(List<SysDept> depts) {
        List<DeptTree> treeList = depts.stream()
                .filter(dept -> !dept.getDeptId().equals(dept.getParentId()))
                .map(dept -> {
                    DeptTree node = new DeptTree();
                    node.setId(dept.getDeptId());
                    node.setParentId(dept.getParentId());
                    node.setName(dept.getName());
                    return node;
                }).collect(Collectors.toList());
        return TreeUtils.buildByLoop(treeList, 0);
    }
}

