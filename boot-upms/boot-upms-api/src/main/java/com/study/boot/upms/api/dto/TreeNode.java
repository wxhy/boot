package com.study.boot.upms.api.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/22 21:56
 */
@Data
public class TreeNode {

    protected int id;
    protected int parentId;
    protected List<TreeNode> children = new ArrayList<>();

    public void add(TreeNode node) {
        children.add(node);
    }
}
