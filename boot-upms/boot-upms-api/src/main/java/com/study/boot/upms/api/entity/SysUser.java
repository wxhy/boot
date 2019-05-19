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
 * @author 32045
 */
@ApiModel(value = "com.study.boot.upms.entity.SysUser")
@Data
@TableName(value = "sys_user")
public class SysUser extends Model<SysUser> {
    /**
     * 主键ID
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    @ApiModelProperty(value = "主键ID")
    private Integer userId;

    /**
     * 用户名
     */
    @TableField(value = "username")
    @ApiModelProperty(value = "用户名")
    private String username;

    @TableField(value = "password")
    @ApiModelProperty(value = "null")
    private String password;

    /**
     * 简介
     */
    @TableField(value = "phone")
    @ApiModelProperty(value = "简介")
    private String phone;

    /**
     * 头像
     */
    @TableField(value = "avatar")
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
     * 部门ID
     */
    @TableField(value = "dept_id")
    @ApiModelProperty(value = "部门ID")
    private Integer deptId;

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
     * 0-正常，9-锁定
     */
    @TableField(value = "lock_flag")
    @ApiModelProperty(value = "0-正常，9-锁定")
    private String lockFlag;

    /**
     * 0-正常，1-删除
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value = "0-正常，1-删除")
    private String delFlag;

    /**
     * 微信openid
     */
    @TableField(value = "wx_openid")
    @ApiModelProperty(value = "微信openid")
    private String wxOpenid;

    /**
     * QQ openid
     */
    @TableField(value = "qq_openid")
    @ApiModelProperty(value = "QQ openid")
    private String qqOpenid;

}