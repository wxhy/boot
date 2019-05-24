package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author Administrator
 */
@ApiModel(value="com.study.boot.upms.entity.SysDeptRelation")
@Data
@TableName(value = "sys_dept_relation")
public class SysDeptRelation extends Model<SysDeptRelation> {
    /**
     * 祖先节点
     */
     @TableId(value = "ancestor", type = IdType.INPUT)
    @ApiModelProperty(value="祖先节点")
    private Integer ancestor;

    /**
     * 后代节点
     */
     @TableId(value = "descendant", type = IdType.INPUT)
    @ApiModelProperty(value="后代节点")
    private Integer descendant;
}