package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysRole;
import com.study.boot.upms.api.entity.SysRoleMenu;
import com.study.boot.upms.mapper.SysRoleMapper;
import com.study.boot.upms.service.SysRoleMenuService;
import com.study.boot.upms.service.SysRoleService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService{

    private final SysRoleMenuService sysRoleMenuService;

    @Override
    public List<SysRole> listRolesByUserId(Integer userId) {
        return baseMapper.listRolesByUserId(userId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeRoleById(Integer id) {
        sysRoleMenuService.remove(Wrappers.<SysRoleMenu>query().lambda().eq(SysRoleMenu::getRoleId,id));
        return this.removeById(id);
    }

}
