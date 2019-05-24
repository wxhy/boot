package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色菜单表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysRoleMenu extends Model<SysRoleMenu> {
    /**
     * 角色ID
     */
    private Integer roleId;

    /**
     * 菜单ID
     */
    private Integer menuId;
}