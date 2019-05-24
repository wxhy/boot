package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 会员角色关系表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysUserRole extends Model<SysUserRole> {
    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 角色ID
     */
    private Integer roleId;
}