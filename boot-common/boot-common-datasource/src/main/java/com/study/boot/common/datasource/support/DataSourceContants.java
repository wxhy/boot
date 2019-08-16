package com.study.boot.common.datasource.support;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 数据源相关常量
 *
 * @author carlos
 */
@Getter
@AllArgsConstructor
public enum DataSourceContants {

    /**
     * 主库
     */
    MASTER("master", "主库"),

    /**
     * 从库
     */
    SLAVE("slave", "从库");

    public String value;

    public String description;

}
