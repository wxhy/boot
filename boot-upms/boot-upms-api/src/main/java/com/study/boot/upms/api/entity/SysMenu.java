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
 * 菜单权限表
 * @author Administrator
 */
@ApiModel(value="菜单权限表")
@Data
@TableName(value = "sys_menu")
public class SysMenu extends Model<SysMenu> {
    /**
     * 菜单ID
     */
     @TableId(value = "menu_id", type = IdType.INPUT)
    @ApiModelProperty(value="菜单ID")
    private Integer menuId;

    /**
     * 菜单名称
     */
    @TableField(value = "name")
    @ApiModelProperty(value="菜单名称")
    private String name;

    /**
     * 菜单权限标识
     */
    @TableField(value = "permission")
    @ApiModelProperty(value="菜单权限标识")
    private String permission;

    /**
     * 前端URL
     */
    @TableField(value = "path")
    @ApiModelProperty(value="前端URL")
    private String path;

    /**
     * 父菜单ID
     */
    @TableField(value = "parent_id")
    @ApiModelProperty(value="父菜单ID")
    private Integer parentId;

    /**
     * 图标
     */
    @TableField(value = "icon")
    @ApiModelProperty(value="图标")
    private String icon;

    /**
     * 排序值
     */
    @TableField(value = "sort")
    @ApiModelProperty(value="排序值")
    private Integer sort;

    /**
     * 0-开启，1- 关闭
     */
    @TableField(value = "keep_alive")
    @ApiModelProperty(value="0-开启，1- 关闭")
    private String keepAlive;

    /**
     * 菜单类型 （0菜单 1按钮）
     */
    @TableField(value = "type")
    @ApiModelProperty(value="菜单类型 （0菜单 1按钮）")
    private String type;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    @ApiModelProperty(value="更新时间")
    private LocalDateTime updateTime;

    /**
     * 逻辑删除标记(0--正常 1--删除)
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value="逻辑删除标记(0--正常 1--删除)")
    private String delFlag;

}