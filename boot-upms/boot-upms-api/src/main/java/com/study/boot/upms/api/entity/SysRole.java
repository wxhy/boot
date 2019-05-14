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
 * 系统角色表
 * @author Administrator
 */
@ApiModel(value="系统角色表")
@Data
@TableName(value = "sys_role")
public class SysRole extends Model<SysRole> {
     @TableId(value = "role_id", type = IdType.AUTO)
    @ApiModelProperty(value="null")
    private Integer roleId;

    @TableField(value = "role_name")
    @ApiModelProperty(value="null")
    private String roleName;

    @TableField(value = "role_code")
    @ApiModelProperty(value="null")
    private String roleCode;

    @TableField(value = "role_desc")
    @ApiModelProperty(value="null")
    private String roleDesc;

    @TableField(value = "create_time")
    @ApiModelProperty(value="null")
    private LocalDateTime createTime;

    @TableField(value = "update_time")
    @ApiModelProperty(value="null")
    private LocalDateTime updateTime;

    /**
     * 删除标识（0-正常,1-删除）
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value="删除标识（0-正常,1-删除）")
    private String delFlag;
}