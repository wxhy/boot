package com.study.boot.common.annotation;

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
}
