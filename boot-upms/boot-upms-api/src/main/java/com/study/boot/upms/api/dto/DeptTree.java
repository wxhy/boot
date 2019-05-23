package com.study.boot.upms.api.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 部门树
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DeptTree extends TreeNode{

    private String name;
}
