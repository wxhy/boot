package com.study.boot.common.constants;

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

    /**
     * 路由存放
     */
    String ROUTE_KEY = "gateway_route_key";

    /**
     * 日志状态
     */
    String LOG_TYPE = "log_type";

    /**
     * 第三方登录类型
     */
    String SOCIAL_TYPE= "social_type";

    /**
     * 请假状态
     */
    String LEAVE_STATUS = "leave_status";

    /**
     * 消息类型
     */
    String MESSAGE_TYPE = "message_type";

    /**
     * 默认存储bucket
     */
    String BUCKET_NAME = "oss";

    /**
     * chunk存储bucket
     */
    String CHUNK_BUCKET_NAME="chunk";

    /**
     * 临时文件存储
     */
    String FILE_SYSTEM = "file-system/";


}
