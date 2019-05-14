package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 *  角色菜单表
 * @author Administrator
 */
@ApiModel(value="角色菜单表")
@Data
@TableName(value = "sys_role_menu")
public class SysRoleMenu extends Model<SysRoleMenu> {
    /**
     * 角色ID
     */
     @TableId(value = "role_id", type = IdType.INPUT)
    @ApiModelProperty(value="角色ID")
    private Integer roleId;

    /**
     * 菜单ID
     */
     @TableId(value = "menu_id", type = IdType.INPUT)
    @ApiModelProperty(value="菜单ID")
    private Integer menuId;
}