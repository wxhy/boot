package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.dto.DeptTree;
import com.study.boot.upms.api.entity.SysDept;
import com.study.boot.upms.api.util.TreeUtils;
import com.study.boot.upms.mapper.SysDeptMapper;
import com.study.boot.upms.service.SysDeptService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

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
}

