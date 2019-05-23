package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysMenu;
import com.study.boot.upms.api.entity.SysRoleMenu;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.mapper.SysMenuMapper;
import com.study.boot.upms.service.SysMenuService;
import com.study.boot.upms.service.SysRoleMenuService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService{

    private final SysRoleMenuService sysRoleMenuService;

    @Override
    public List<MenuVO> getMenuByRoleId(Integer roleId) {
        return baseMapper.listMenusByRoleId(roleId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeMenuById(Integer id) {
        //删除菜单权限关系
        sysRoleMenuService.remove(Wrappers.<SysRoleMenu>query()
                .lambda().eq(SysRoleMenu::getMenuId, id));
        return this.removeById(id);
    }
}
