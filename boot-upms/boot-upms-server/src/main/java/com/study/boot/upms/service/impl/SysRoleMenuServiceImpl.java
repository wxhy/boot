package com.study.boot.upms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysRoleMenu;
import com.study.boot.upms.mapper.SysRoleMenuMapper;
import com.study.boot.upms.service.SysRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService{


    /**
     * @param roleId  角色
     * @param menuIds 菜单ID拼成的字符串，每个id之间根据逗号分隔
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveRoleMenus(Integer roleId, String menuIds) {
        this.remove(Wrappers.<SysRoleMenu>query().lambda().eq(SysRoleMenu::getRoleId,roleId));
        if(StrUtil.isBlank(menuIds)) {
            return Boolean.TRUE;
        }
        List<SysRoleMenu> roleMenus = Arrays.stream(menuIds.split(","))
                .map(menuId -> {
                    SysRoleMenu sysRoleMenu = new SysRoleMenu();
                    sysRoleMenu.setMenuId(Integer.valueOf(menuId));
                    sysRoleMenu.setRoleId(roleId);
                    return sysRoleMenu;
                }).collect(Collectors.toList());
        return this.saveBatch(roleMenus);
    }
}
