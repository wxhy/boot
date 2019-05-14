package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 角色与部门对应关系
 * @author Administrator
 */
@ApiModel(value="角色与部门对应关系")
@Data
@TableName(value = "sys_role_dept")
public class SysRoleDept extends Model<SysRoleDept> {
     @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="null")
    private Integer id;

    /**
     * 角色ID
     */
    @TableField(value = "role_id")
    @ApiModelProperty(value="角色ID")
    private Integer roleId;

    /**
     * 部门ID
     */
    @TableField(value = "dept_id")
    @ApiModelProperty(value="部门ID")
    private Integer deptId;
}