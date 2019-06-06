package com.study.boot.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 日志类型
 * @author Administrator
 */
@Getter
@AllArgsConstructor
public enum LogTypeEnum {

    /**
     * 登录日志
     */
    LOGIN("0","登录日志"),

    /**
     * 操作日志
     */
    OPERATION("1","操作日志");


    /**
     * 类型
     */
    private String type;

    /**
     * 描述
     */
    private String description;
}
