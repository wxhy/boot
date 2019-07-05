package com.study.boot.codegen.entity;

import lombok.Data;

import java.util.List;

/**
 * 表属性
 * @author Administrator
 * 表属性： https://blog.csdn.net/lkforce/article/details/79557482
 */
@Data
public class TableEntity {

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 注释
     */
    private String comments;

    /**
     * 主键
     */
    private ColumnEntity pk;

    /**
     * 表字段
     */
    private List<ColumnEntity> columns;

    /**
     * 驼峰类型
     */
    private String caseClassName;

    /**
     * 普通类型
     */
    private String lowerClassName;


}
