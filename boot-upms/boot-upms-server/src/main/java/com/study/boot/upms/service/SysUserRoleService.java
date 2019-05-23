package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysUserRole;

/**
 * @author Administrator
 */
public interface SysUserRoleService extends IService<SysUserRole>{

    /**
     * 根据会员ID删除会员角色信息
     * @param userId
     * @return
     */
    Boolean removeRoleByUserId(Integer userId);
}
