package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 日志表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysLog extends Model<SysLog> {
    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 日志类型
     */
    @NotBlank(message = "日志类型不能为空")
    private String type;

    /**
     * 日志标题
     */
    @NotBlank(message = "日志标题不能为空")
    private String title;

    /**
     * 服务ID
     */
    private String serviceId;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 操作IP地址
     */
    private String remoteAddr;

    /**
     * 用户代理
     */
    private String userAgent;

    /**
     * 请求URI
     */
    private String requestUri;

    /**
     * 操作方式
     */
    private String method;

    /**
     * 操作提交的数据
     */
    private String params;

    /**
     * 执行时间
     */
    private String time;

    /**
     * 删除标记
     */
    private String delFlag;

    /**
     * 异常信息
     */
    private String exception;
}