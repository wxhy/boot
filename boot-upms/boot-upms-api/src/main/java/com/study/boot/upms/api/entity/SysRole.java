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
@TableName(value = "sys_role")
public class SysRole extends Model<SysRole> {
    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer roleId;

    @TableField(value = "role_name")
    private String roleName;

    @TableField(value = "role_code")
    private String roleCode;

    @TableField(value = "role_desc")
    private String roleDesc;

    /**
     * 数据权限类型
     */
    @TableField(value = "ds_type")
    private String dsType;

    /**
     * 数据权限范围
     */
    @TableField(value = "ds_scope")
    private String dsScope;

    @TableField(value = "create_time")
    private LocalDateTime createTime;

    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 删除标识（0-正常,1-删除）
     */
    @TableField(value = "del_flag")
    private String delFlag;

    public static final String COL_ROLE_NAME = "role_name";

    public static final String COL_ROLE_CODE = "role_code";

    public static final String COL_ROLE_DESC = "role_desc";

    public static final String COL_DS_TYPE = "ds_type";

    public static final String COL_DS_SCOPE = "ds_scope";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_DEL_FLAG = "del_flag";
}