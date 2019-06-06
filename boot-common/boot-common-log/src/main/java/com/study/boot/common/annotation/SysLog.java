package com.study.boot.common.annotation;

import com.study.boot.common.enums.LogTypeEnum;

import java.lang.annotation.*;

/**
 *  操作日志注解
 * @author Administrator
 */
@Documented
@Target(value = ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface SysLog {

    /**
     * 描述
     * @return
     */
    String value();

    /**
     * 日志类型
     * @return
     */
    LogTypeEnum type() default LogTypeEnum.OPERATION;
}
