package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_user")
public class SysUser extends Model<SysUser> {
    /**
     * 主键ID
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    private Integer userId;

    /**
     * 用户名
     */
    @TableField(value = "username")
    private String username;

    @TableField(value = "password")
    private String password;

    /**
     * 随机盐
     */
    @TableField(value = "salt")
    private String salt;

    /**
     * 简介
     */
    @TableField(value = "phone")
    private String phone;

    /**
     * 头像
     */
    @TableField(value = "avatar")
    private String avatar;

    /**
     * 部门ID
     */
    @TableField(value = "dept_id")
    private Integer deptId;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 0-正常，9-锁定
     */
    @TableField(value = "lock_flag")
    private String lockFlag;

    /**
     * 0-正常，1-删除
     */
    @TableField(value = "del_flag")
    private String delFlag;

    /**
     * 微信openid
     */
    @TableField(value = "wx_openid")
    private String wxOpenid;

    /**
     * QQ openid
     */
    @TableField(value = "qq_openid")
    private String qqOpenid;

    public static final String COL_USERNAME = "username";

    public static final String COL_PASSWORD = "password";

    public static final String COL_SALT = "salt";

    public static final String COL_PHONE = "phone";

    public static final String COL_AVATAR = "avatar";

    public static final String COL_DEPT_ID = "dept_id";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_LOCK_FLAG = "lock_flag";

    public static final String COL_DEL_FLAG = "del_flag";

    public static final String COL_WX_OPENID = "wx_openid";

    public static final String COL_QQ_OPENID = "qq_openid";
}