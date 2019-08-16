package com.study.boot.upms.api.util;

import com.study.boot.upms.api.dto.MenuTree;
import com.study.boot.upms.api.dto.TreeNode;
import com.study.boot.upms.api.entity.SysMenu;
import lombok.experimental.UtilityClass;

import java.util.ArrayList;
import java.util.List;

/**
 * 树形菜单工具类
 * @author Carlos
 * @version 1.0
 * @date 2019/5/22 21:54
 */
@UtilityClass
public class TreeUtils {

    /**
     * 双重循环生成树形菜单
     * @param treeNodes
     * @param root
     * @param <T>
     * @return
     */
    public <T extends TreeNode> List<T> buildByLoop(List<T> treeNodes,Object root) {
        List<T> trees = new ArrayList<>();
        for (T treeNode : treeNodes) {
            if(root.equals(treeNode.getParentId())){
                trees.add(treeNode);
            }
            for(T td: treeNodes) {
                if(td.getParentId() == treeNode.getId()) {
                    if(treeNode.getChildren() == null) {
                        treeNode.setChildren(new ArrayList<>());
                    }
                    treeNode.add(td);
                }
            }
        }
        return trees;
    }


    /**
     * 递归查找子节点
     *
     * @param treeNodes
     * @return
     */
    public <T extends TreeNode>  T findChildren(T treeNode, List<T> treeNodes) {
        for (T td: treeNodes) {
            if(td.getParentId()  == treeNode.getId()) {
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<>());
                }
                treeNode.add(findChildren(td,treeNodes));
            }
        }
        return  treeNode;
    }

    /**
     * 使用递归方法创建树形菜单
     * @param treeNodes
     * @param root
     * @param <T>
     * @return
     */
    public <T extends  TreeNode> List<T> buildByRecursive(List<T> treeNodes,Object root) {
        List<T> trees = new ArrayList<T>();
        for(T treeNode: treeNodes) {
            if(root.equals(treeNode.getParentId())) {
                trees.add(findChildren(treeNode,treeNodes));
            }
        }
        return trees;
    }


    /**
     * 通过sysMenu创建树形节点
     *
     * @param menus
     * @param root
     * @return
     */
    public List<MenuTree> buildTree(List<SysMenu> menus, int root) {
        List<MenuTree> trees = new ArrayList<>();
        MenuTree node;
        for (SysMenu menu : menus) {
            node = new MenuTree();
            node.setId(menu.getMenuId());
            node.setParentId(menu.getParentId());
            node.setName(menu.getName());
            node.setPath(menu.getPath());
            node.setCode(menu.getPermission());
            node.setLabel(menu.getName());
            node.setIcon(menu.getIcon());
            node.setKeepAlive(menu.getKeepAlive());
            node.setSort(menu.getSort());
            trees.add(node);
        }
        return TreeUtils.buildByLoop(trees, root);
    }

}
