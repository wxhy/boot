package com.study.boot.upms.api.dto;

import com.study.boot.upms.api.entity.SysUser;
import lombok.Data;

import java.io.Serializable;

/**
 * @author 32045
 */
@Data
public class UserInfo implements Serializable {

    /**
     * 用户基本信息
     */
    private SysUser sysUser;
    /**
     * 权限标识集合
     */
    private String[] permissions;

    /**
     * 角色集合
     */
    private Integer[] roles;
}
