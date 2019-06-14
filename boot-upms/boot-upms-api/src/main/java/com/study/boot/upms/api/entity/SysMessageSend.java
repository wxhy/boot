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
@TableName(value = "sys_message_send")
public class SysMessageSend extends Model<SysMessageSend> {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField(value = "message_id")
    private Integer messageId;

    @TableField(value = "user_id")
    private Integer userId;

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
     * 类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 发送用户名
     */
    @TableField(value = "user_name")
    private String userName;

    /**
     * 是否已读 0未读 1已读
     */
    @TableField(value = "status")
    private String status;

    /**
     * 删除标识
     */
    @TableField(value = "delFlag")
    private String delflag;

    /**
     * 创建人
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**
     * 修改人
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 修改时间
     */
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    public static final String COL_MESSAGE_ID = "message_id";

    public static final String COL_USER_ID = "user_id";

    public static final String COL_TITLE = "title";

    public static final String COL_CONTENT = "content";

    public static final String COL_TYPE = "type";

    public static final String COL_USER_NAME = "user_name";

    public static final String COL_STATUS = "status";

    public static final String COL_DELFLAG = "delFlag";

    public static final String COL_CREATE_BY = "create_by";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_BY = "update_by";

    public static final String COL_UPDATE_TIME = "update_time";
}