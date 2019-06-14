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
@TableName(value = "sys_menu")
@EqualsAndHashCode(callSuper = true)
public class SysMenu extends Model<SysMenu> {
    /**
     * 菜单ID
     */
    @TableId(value = "menu_id", type = IdType.INPUT)
    private Integer menuId;

    /**
     * 菜单名称
     */
    @TableField(value = "name")
    private String name;

    /**
     * 菜单权限标识
     */
    @TableField(value = "permission")
    private String permission;

    /**
     * 前端URL
     */
    @TableField(value = "path")
    private String path;

    /**
     * 父菜单ID
     */
    @TableField(value = "parent_id")
    private Integer parentId;

    /**
     * 图标
     */
    @TableField(value = "icon")
    private String icon;

    /**
     * VUE页面
     */
    @TableField(value = "component")
    private String component;

    /**
     * 排序值
     */
    @TableField(value = "sort")
    private Integer sort;

    /**
     * 0-开启，1- 关闭
     */
    @TableField(value = "keep_alive")
    private String keepAlive;

    /**
     * 菜单类型 （0菜单 1按钮）
     */
    @TableField(value = "type")
    private String type;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 逻辑删除标记(0--正常 1--删除)
     */
    @TableField(value = "del_flag")
    private String delFlag;

    public static final String COL_NAME = "name";

    public static final String COL_PERMISSION = "permission";

    public static final String COL_PATH = "path";

    public static final String COL_PARENT_ID = "parent_id";

    public static final String COL_ICON = "icon";

    public static final String COL_COMPONENT = "component";

    public static final String COL_SORT = "sort";

    public static final String COL_KEEP_ALIVE = "keep_alive";

    public static final String COL_TYPE = "type";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_DEL_FLAG = "del_flag";
}