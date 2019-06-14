package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_log")
public class SysLog extends Model<SysLog> {
    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 日志类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 日志标题
     */
    @TableField(value = "title")
    private String title;

    /**
     * 服务ID
     */
    @TableField(value = "service_id")
    private String serviceId;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 操作IP地址
     */
    @TableField(value = "remote_addr")
    private String remoteAddr;

    /**
     * 用户代理
     */
    @TableField(value = "user_agent")
    private String userAgent;

    /**
     * 请求URI
     */
    @TableField(value = "request_uri")
    private String requestUri;

    /**
     * 操作方式
     */
    @TableField(value = "method")
    private String method;

    /**
     * 操作提交的数据
     */
    @TableField(value = "params")
    private String params;

    /**
     * 执行时间
     */
    @TableField(value = "time")
    private Long time;

    /**
     * 删除标记
     */
    @TableField(value = "del_flag")
    private String delFlag;

    /**
     * 异常信息
     */
    @TableField(value = "exception")
    private String exception;

    public static final String COL_TYPE = "type";

    public static final String COL_TITLE = "title";

    public static final String COL_SERVICE_ID = "service_id";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_REMOTE_ADDR = "remote_addr";

    public static final String COL_USER_AGENT = "user_agent";

    public static final String COL_REQUEST_URI = "request_uri";

    public static final String COL_METHOD = "method";

    public static final String COL_PARAMS = "params";

    public static final String COL_TIME = "time";

    public static final String COL_DEL_FLAG = "del_flag";

    public static final String COL_EXCEPTION = "exception";
}