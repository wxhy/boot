package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 部门管理
 * @author Administrator
 */
@ApiModel(value = "部门管理")
@Data
@TableName(value = "boot.sys_dept")
public class SysDept extends Model<SysDept> {
    @TableId(value = "dept_id", type = IdType.AUTO)
    @ApiModelProperty(value = "null")
    private Integer deptId;

    /**
     * 部门名称
     */
    @TableField(value = "name")
    @ApiModelProperty(value = "部门名称")
    private String name;

    /**
     * 排序
     */
    @TableField(value = "sort")
    @ApiModelProperty(value = "排序")
    private Integer sort;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    @ApiModelProperty(value = "修改时间")
    private LocalDateTime updateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value = "是否删除  -1：已删除  0：正常")
    private String delFlag;

    @TableField(value = "parent_id")
    @ApiModelProperty(value = "null")
    private Integer parentId;

}