package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 部门关系表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysDeptRelation extends Model<SysDeptRelation> {
    /**
     * 祖先节点
     */
    private Integer ancestor;

    /**
     * 后代节点
     */
    private Integer descendant;
}