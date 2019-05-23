package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.MenuTree;
import com.study.boot.upms.api.util.TreeUtils;
import com.study.boot.upms.api.vo.MenuVO;
import com.study.boot.upms.service.SysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping("/tree")
    public WebResponse getTree(){
        return new WebResponse<>(TreeUtils.buildTree(sysMenuService.list(Wrappers.emptyWrapper()),-1));
    }

}
