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
@TableName(value = "sys_social_details")
public class SysSocialDetails extends Model<SysSocialDetails> {
    /**
     * 主鍵
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 描述
     */
    @TableField(value = "remark")
    private String remark;

    /**
     * appid
     */
    @TableField(value = "app_id")
    private String appId;

    /**
     * app_secret
     */
    @TableField(value = "app_secret")
    private String appSecret;

    /**
     * 回调地址
     */
    @TableField(value = "redirect_url")
    private String redirectUrl;

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
     * 删除标记
     */
    @TableField(value = "del_flag")
    private String delFlag;

    public static final String COL_TYPE = "type";

    public static final String COL_REMARK = "remark";

    public static final String COL_APP_ID = "app_id";

    public static final String COL_APP_SECRET = "app_secret";

    public static final String COL_REDIRECT_URL = "redirect_url";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_DEL_FLAG = "del_flag";
}