package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 日志表
 * @author Administrator
 */
@ApiModel(value="日志表")
@Data
@TableName(value = "sys_log")
public class SysLog extends Model<SysLog> {
    /**
     * 编号
     */
     @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="编号")
    private Long id;

    /**
     * 日志类型
     */
    @TableField(value = "type")
    @ApiModelProperty(value="日志类型")
    private String type;

    /**
     * 日志标题
     */
    @TableField(value = "title")
    @ApiModelProperty(value="日志标题")
    private String title;

    /**
     * 服务ID
     */
    @TableField(value = "service_id")
    @ApiModelProperty(value="服务ID")
    private String serviceId;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    @ApiModelProperty(value="创建者")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @ApiModelProperty(value="创建时间")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    @ApiModelProperty(value="更新时间")
    private LocalDateTime updateTime;

    /**
     * 操作IP地址
     */
    @TableField(value = "remote_addr")
    @ApiModelProperty(value="操作IP地址")
    private String remoteAddr;

    /**
     * 用户代理
     */
    @TableField(value = "user_agent")
    @ApiModelProperty(value="用户代理")
    private String userAgent;

    /**
     * 请求URI
     */
    @TableField(value = "request_uri")
    @ApiModelProperty(value="请求URI")
    private String requestUri;

    /**
     * 操作方式
     */
    @TableField(value = "method")
    @ApiModelProperty(value="操作方式")
    private String method;

    /**
     * 操作提交的数据
     */
    @TableField(value = "params")
    @ApiModelProperty(value="操作提交的数据")
    private String params;

    /**
     * 执行时间
     */
    @TableField(value = "time")
    @ApiModelProperty(value="执行时间")
    private String time;

    /**
     * 删除标记
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value="删除标记")
    private String delFlag;

    /**
     * 异常信息
     */
    @TableField(value = "exception")
    @ApiModelProperty(value="异常信息")
    private String exception;

}