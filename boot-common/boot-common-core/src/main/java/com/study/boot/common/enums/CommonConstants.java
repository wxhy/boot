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


    /**
     * 菜单
     */
    String MENU = "0";

    /**
     * 验证码前缀
     */
    String DEFAULT_CODE_KEY = "DEFAULT_CODE_KEY_";

    /**
     * 验证码有效期
     */
    int CODE_TIME = 60;

    /**
     * 编码
     */
    String UTF8 = "UTF-8";
    /**
     * 数据字典缓存前缀
     */
    String DICTS = "DICTS:";
}
