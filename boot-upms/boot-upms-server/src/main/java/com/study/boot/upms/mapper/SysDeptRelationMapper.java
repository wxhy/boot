package com.study.boot.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.upms.api.entity.SysDeptRelation;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Administrator
 */
@Mapper
public interface SysDeptRelationMapper extends BaseMapper<SysDeptRelation> {

    /**
     * 删除部门关系表数据
     *
     * @param id 部门ID
     */
    void removeDeptRelationById(Integer id);

    /**
     * 更改部分关系表数据
     *
     * @param relation
     */
    void updateDeptRelation(SysDeptRelation relation);
}