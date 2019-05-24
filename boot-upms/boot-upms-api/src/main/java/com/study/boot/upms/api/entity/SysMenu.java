package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * 菜单表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysMenu extends Model<SysMenu> {
    /**
     * 菜单ID
     */
    @TableId(value = "menu_id", type = IdType.INPUT)
    @NotNull(message = "菜单ID不能为空")
    private Integer menuId;

    /**
     * 菜单名称
     */
    @NotBlank(message = "菜单名称不能为空")
    private String name;

    /**
     * 菜单权限标识
     */
    private String permission;

    /**
     * 前端URL
     */
    private String path;

    /**
     * 父菜单ID
     */
    @NotNull(message = "菜单父ID不能为空")
    private Integer parentId;

    /**
     * 图标
     */
    private String icon;

    /**
     * VUE页面
     */
    private String component;

    /**
     * 排序值
     */
    private Integer sort;

    /**
     * 0-开启，1- 关闭
     */
    private String keepAlive;

    /**
     * 菜单类型 （0菜单 1按钮）
     */
    @NotNull(message = "菜单类型不能为空")
    private String type;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 逻辑删除标记(0--正常 1--删除)
     */
    private String delFlag;
}