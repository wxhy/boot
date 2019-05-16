package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysMenu;
import com.study.boot.upms.api.vo.MenuVO;

import java.util.List;

/**
 * @author Administrator
 */
public interface SysMenuService extends IService<SysMenu>{

    /**
     * 通过角色编号查询URL 权限
     *
     * @param roleId 角色ID
     * @return 菜单列表
     */
    List<MenuVO> getMenuByRoleId(Integer roleId);
}
