package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysRole;

import java.util.List;

/**
 * @author Administrator
 */
public interface SysRoleService extends IService<SysRole>{


    /**
     * 通过用户ID，查询角色信息
     *
     * @param userId
     * @return
     */
    List<SysRole> listRolesByUserId(Integer userId);

    /**
     * 根据角色Id删除角色
     * @param id
     * @return
     */
    Boolean removeRoleById(Integer id);

}
