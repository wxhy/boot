package com.study.boot.upms.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysDept;
import com.study.boot.upms.api.entity.SysDeptRelation;
import com.study.boot.upms.mapper.SysDeptRelationMapper;
import com.study.boot.upms.service.SysDeptRelationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
public class SysDeptRelationServiceImpl extends ServiceImpl<SysDeptRelationMapper, SysDeptRelation> implements SysDeptRelationService{

    /**
     * 增加部门关系
     * @param sysDept 部门
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveDeptRelation(SysDept sysDept) {
        List<SysDeptRelation> relations = this.baseMapper.selectList(Wrappers.<SysDeptRelation>query()
                .lambda().eq(SysDeptRelation::getDescendant, sysDept.getParentId()))
                .stream()
                .map(sysDeptRelation -> {
                    sysDeptRelation.setDescendant(sysDept.getDeptId());
                    return sysDeptRelation;
                }).collect(Collectors.toList());
        if(CollUtil.isNotEmpty(relations)) {
            this.saveBatch(relations);
        }

        SysDeptRelation relation = new SysDeptRelation();
        relation.setDescendant(sysDept.getDeptId());
        relation.setAncestor(sysDept.getDeptId());
        this.save(relation);
    }

    /**
     * 通过ID删除部门关系
     * @param id
     */
    @Override
    public void removeDeptRelationById(Integer id) {
        baseMapper.removeDeptRelationById(id);
    }

    /**
     * 更新部门关系
     * @param relation
     */
    @Override
    public void updateDeptRelation(SysDeptRelation relation) {
        baseMapper.updateDeptRelation(relation);
    }
}
