package com.study.boot.upms.web;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.MenuTree;
import com.study.boot.upms.api.entity.SysMenu;
import com.study.boot.upms.api.util.TreeUtils;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.service.SysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/22 21:38
 */

@RestController
@RequestMapping(value = "/menu")
@AllArgsConstructor
public class MenuController {

    private final SysMenuService sysMenuService;

    /**
     *  返回当前用户的树形菜单集合
     * @return 当前用户的树形菜单
     */
    @GetMapping
    public WebResponse getUserMenus(){
        // 获取符合条件的菜单
        Set<MenuVO> all = new HashSet<>();
        SecurityUtils.getRoleIds()
                .forEach(roleId-> all.addAll(sysMenuService.getMenuByRoleId(roleId)));
        List<MenuTree> menuTreeList = all.stream()
                .filter(menuVO -> CommonConstants.MENU.equals(menuVO.getType()))
                .map(MenuTree::new)
                .sorted(Comparator.comparingInt(MenuTree::getSort))
                .collect(Collectors.toList());
        return new WebResponse<>(TreeUtils.buildByLoop(menuTreeList, -1));
    }

    /**
     * 返回树形菜单集合
     * @return
     */
    @GetMapping("/tree")
    public WebResponse getTree(){
        return new WebResponse<>(TreeUtils.buildTree(sysMenuService.list(Wrappers.emptyWrapper()),-1));
    }

    /**
     *  获取角色的菜单集合
     * @param roleId
     * @return 属性集合
     */
    @GetMapping("/tree/{roleId}")
    public List getRoleTree(@PathVariable Integer roleId){
        return sysMenuService.getMenuByRoleId(roleId)
                .stream()
                .map(MenuVO::getMenuId)
                .collect(Collectors.toList());
    }

    /**
     * 菜单详情
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getMenuDetail(@PathVariable Integer id){
        return new WebResponse<>(sysMenuService.getById(id));
    }

    /**
     * 保存菜单信息
     * @param sysMenu
     * @return
     */
    @PostMapping
    @SysLog("添加菜单")
    public WebResponse saveMenu(@RequestBody SysMenu sysMenu) {
        return new WebResponse<>(sysMenuService.save(sysMenu));
    }

    /**
     * 删除菜单
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @SysLog("删除菜单")
    public WebResponse deleteMenu(@PathVariable Integer id) {
        List<SysMenu> menus = sysMenuService.list(Wrappers.<SysMenu>query().lambda().eq(SysMenu::getParentId, id));
        if(CollectionUtil.isNotEmpty(menus)){
            return new WebResponse<>(CommonConstants.FAIL, "菜单含有下级菜单，不能删除");
        }
        return new WebResponse(sysMenuService.removeMenuById(id));
    }

    /**
     * 修改菜单信息
     * @param sysMenu
     * @return
     */
    @PutMapping
    @SysLog("修改菜单")
    public WebResponse updateMenu(@RequestBody SysMenu sysMenu) {
        return new WebResponse<>(sysMenuService.updateById(sysMenu));
    }

}
