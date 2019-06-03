package com.study.boot.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 流程状态
 * @author Administrator
 */

@Getter
@AllArgsConstructor
public enum ProcessStatusEnum {

    /**
     * 活跃
     */
    ACTIVE("active", "活跃"),

    /**
     * 失效
     */
    SUSPEND("suspend", "失效");

    /**
     * 类型
     */
    private final String status;
    /**
     * 描述
     */
    private final String description;
}
