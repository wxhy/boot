package com.study.boot.daemon.quartz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author carlos
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "sys_job")
public class SysJob extends Model<SysJob> {
    /**
     * 任务id
     */
    @TableId(value = "job_id", type = IdType.AUTO)
    private Integer jobId;

    /**
     * 任务名称
     */
    @TableId(value = "job_name", type = IdType.INPUT)
    private String jobName;

    /**
     * 任务组名
     */
    @TableId(value = "job_group", type = IdType.INPUT)
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
     * job_type=3时，rest调用地址，仅支持rest get协议,需要增加String返回值，0成功，1失败;job_type=4时，jar路径;其它值为空
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
     * 错失执行策略（1错失周期立即执行 2错失周期执行一次 3下周期执行）
     */
    @TableField(value = "misfire_policy")
    private String misfirePolicy;

    /**
     * 状态（1、未发布;2、运行中;3、暂停;4、删除;）
     */
    @TableField(value = "job_status")
    private String jobStatus;

    /**
     * 状态（0正常 1异常）
     */
    @TableField(value = "job_execute_status")
    private String jobExecuteStatus;

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
     * 更新者
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 初次执行时间
     */
    @TableField(value = "start_time")
    private LocalDateTime startTime;

    /**
     * 上次执行时间
     */
    @TableField(value = "previous_time")
    private LocalDateTime previousTime;

    /**
     * 下次执行时间
     */
    @TableField(value = "next_time")
    private LocalDateTime nextTime;

    /**
     * 备注信息
     */
    @TableField(value = "remark")
    private String remark;

    public static final String COL_JOB_ORDER = "job_order";

    public static final String COL_JOB_TYPE = "job_type";

    public static final String COL_EXECUTE_PATH = "execute_path";

    public static final String COL_CLASS_NAME = "class_name";

    public static final String COL_METHOD_NAME = "method_name";

    public static final String COL_METHOD_PARAMS_VALUE = "method_params_value";

    public static final String COL_CRON_EXPRESSION = "cron_expression";

    public static final String COL_MISFIRE_POLICY = "misfire_policy";

    public static final String COL_JOB_STATUS = "job_status";

    public static final String COL_JOB_EXECUTE_STATUS = "job_execute_status";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_BY = "update_by";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_START_TIME = "start_time";

    public static final String COL_PREVIOUS_TIME = "previous_time";

    public static final String COL_NEXT_TIME = "next_time";

    public static final String COL_REMARK = "remark";
}