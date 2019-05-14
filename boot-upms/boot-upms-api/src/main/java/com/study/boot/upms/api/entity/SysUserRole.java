package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 *
 *  用户角色表
 * @author Administrator
 */
@ApiModel(value="用户角色表")
@Data
@TableName(value = "sys_user_role")
public class SysUserRole extends Model<SysUserRole> {
    /**
     * 用户ID
     */
     @TableId(value = "user_id", type = IdType.INPUT)
    @ApiModelProperty(value="用户ID")
    private Integer userId;

    /**
     * 角色ID
     */
     @TableId(value = "role_id", type = IdType.INPUT)
    @ApiModelProperty(value="角色ID")
    private Integer roleId;
}