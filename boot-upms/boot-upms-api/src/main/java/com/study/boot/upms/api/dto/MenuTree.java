package com.study.boot.upms.api.dto;

import com.study.boot.upms.api.vo.MenuVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/22 21:55
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MenuTree extends TreeNode {

    private String icon;
    private String name;
    private boolean spread = false;
    private String path;
    private String component;
    private String authority;
    private String redirect;
    private String keepAlive;
    private String code;
    private String type;
    private String label;
    private Integer sort;

    public MenuTree() {
    }

    public MenuTree(int id,String name,int parentId) {
        this.id = id;
        this.name = name;
        this.label = name;
        this.parentId = parentId;
    }

    public MenuTree(int id,String name,MenuTree parent) {
        this.id = id;
        this.name = name;
        this.label = name;
        this.parentId = parent.getId();
    }

    public MenuTree(MenuVO menuVo) {
        this.id = menuVo.getMenuId();
        this.parentId = menuVo.getParentId();
        this.icon = menuVo.getIcon();
        this.name = menuVo.getName();
        this.path = menuVo.getPath();
        this.component = menuVo.getComponent();
        this.type = menuVo.getType();
        this.label = menuVo.getName();
        this.sort = menuVo.getSort();
        this.keepAlive = menuVo.getKeepAlive();
    }

}
