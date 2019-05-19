package com.study.boot.common.enums;

/**
 * 通用的常量标识
 * @author
 */
public interface CommonConstants {

    /**
     * 正常
     */
    String STATUS_NORMAL = "0";

    /**
     * 删除
     */
    String STATUS_DEL = "1";

    /**
     * 锁定
     */
    String STATUS_LOCK = "9";

    /**
     * 成功标记
     */
    Integer SUCCESS = 0;

    /**
     * 失败标记
     */
    Integer FAIL = 1;

    /**
     * 权限不足
     */
    Integer FORBIDDEN_OPERATION = 2;
}
