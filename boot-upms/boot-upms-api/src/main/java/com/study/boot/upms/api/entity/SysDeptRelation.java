package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_dept_relation")
public class SysDeptRelation extends Model<SysDeptRelation> {
    /**
     * 祖先节点
     */
    @TableId(value = "ancestor", type = IdType.INPUT)
    private Integer ancestor;

    /**
     * 后代节点
     */
    @TableId(value = "descendant", type = IdType.INPUT)
    private Integer descendant;
}