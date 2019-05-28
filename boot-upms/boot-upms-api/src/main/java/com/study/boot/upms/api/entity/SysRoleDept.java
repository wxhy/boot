package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色部门表
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/24 22:15
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class SysRoleDept extends Model<SysRoleDept> {

    @TableId(value = "id",type= IdType.AUTO)
    private Integer id;
    private Integer roleId;
    private Integer deptId;
}
