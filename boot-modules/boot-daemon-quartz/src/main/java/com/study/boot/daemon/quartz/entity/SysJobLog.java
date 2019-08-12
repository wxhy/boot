package com.study.boot.daemon.quartz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author carlos
 */
@Data
@TableName(value = "sys_job_log")
@EqualsAndHashCode(callSuper = true)
public class SysJobLog extends Model<SysJobLog> {
    /**
     * 任务日志ID
     */
     @TableId(value = "job_log_id", type = IdType.AUTO)
    private Integer jobLogId;

    /**
     * 任务id
     */
    @TableField(value = "job_id")
    private Integer jobId;

    /**
     * 任务名称
     */
    @TableField(value = "job_name")
    private String jobName;

    /**
     * 任务组名
     */
    @TableField(value = "job_group")
    private String jobGroup;

    /**
     * 组内执行顺利，值越大执行优先级越高，最大值9，最小值1
     */
    @TableField(value = "job_order")
    private String jobOrder;

    /**
     * 1、java类;2、spring bean名称;3、rest调用;4、jar调用;9其他
     */
    @TableField(value = "job_type")
    private String jobType;

    /**
     * job_type=3时，rest调用地址，仅支持post协议;job_type=4时，jar路径;其它值为空
     */
    @TableField(value = "execute_path")
    private String executePath;

    /**
     * job_type=1时，类完整路径;job_type=2时，spring bean名称;其它值为空
     */
    @TableField(value = "class_name")
    private String className;

    /**
     * 任务方法
     */
    @TableField(value = "method_name")
    private String methodName;

    /**
     * 参数值
     */
    @TableField(value = "method_params_value")
    private String methodParamsValue;

    /**
     * cron执行表达式
     */
    @TableField(value = "cron_expression")
    private String cronExpression;

    /**
     * 日志信息
     */
    @TableField(value = "job_message")
    private String jobMessage;

    /**
     * 执行状态（0正常 1失败）
     */
    @TableField(value = "job_log_status")
    private String jobLogStatus;

    /**
     * 执行时间
     */
    @TableField(value = "execute_time")
    private String executeTime;

    /**
     * 异常信息
     */
    @TableField(value = "exception_info")
    private String exceptionInfo;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    public static final String COL_JOB_ID = "job_id";

    public static final String COL_JOB_NAME = "job_name";

    public static final String COL_JOB_GROUP = "job_group";

    public static final String COL_JOB_ORDER = "job_order";

    public static final String COL_JOB_TYPE = "job_type";

    public static final String COL_EXECUTE_PATH = "execute_path";

    public static final String COL_CLASS_NAME = "class_name";

    public static final String COL_METHOD_NAME = "method_name";

    public static final String COL_METHOD_PARAMS_VALUE = "method_params_value";

    public static final String COL_CRON_EXPRESSION = "cron_expression";

    public static final String COL_JOB_MESSAGE = "job_message";

    public static final String COL_JOB_LOG_STATUS = "job_log_status";

    public static final String COL_EXECUTE_TIME = "execute_time";

    public static final String COL_EXCEPTION_INFO = "exception_info";

    public static final String COL_CREATE_TIME = "create_time";
}