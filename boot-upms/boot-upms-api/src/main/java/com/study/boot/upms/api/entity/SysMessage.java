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
@TableName(value = "sys_message")
public class SysMessage extends Model<SysMessage> {
    /**
     * 主键ID
     */
    @TableId(value = "message_id", type = IdType.AUTO)
    private Integer messageId;

    /**
     * 类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 标题
     */
    @TableField(value = "title")
    private String title;

    /**
     * 内容
     */
    @TableField(value = "content")
    private String content;

    /**
     * 发送范围 0全部 1指定
     */
    @TableField(value = "ranger")
    private String ranger;

    /**
     * 新创建账号推送
     */
    @TableField(value = "create_send")
    private String createSend;

    /**
     * 删除标识
     */
    @TableField(value = "del_flag")
    private String delFlag;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**
     * 修改人名称
     */
    @TableField(value = "update_by")
    private String updateBy;

    public static final String COL_TYPE = "type";

    public static final String COL_TITLE = "title";

    public static final String COL_CONTENT = "content";

    public static final String COL_RANGER = "ranger";

    public static final String COL_CREATE_SEND = "create_send";

    public static final String COL_DEL_FLAG = "del_flag";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_UPDATE_BY = "update_by";
}