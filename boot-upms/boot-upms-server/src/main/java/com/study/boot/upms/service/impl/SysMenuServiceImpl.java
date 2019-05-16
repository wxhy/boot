package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.entity.SysMenu;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.mapper.SysMenuMapper;
import com.study.boot.upms.service.SysMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService{


    @Override
    public List<MenuVO> getMenuByRoleId(Integer roleId) {
        return baseMapper.listMenusByRoleId(roleId);
    }
}
