package com.study.boot.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.upms.api.entity.SysMenu;
import com.study.boot.upms.api.vo.MenuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Administrator
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {


    /**
     * 通过角色编号查询菜单
     *
     * @param roleId 角色ID
     * @return
     */
   List<MenuVO> listMenusByRoleId(Integer roleId);
}