package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysMessage extends Model<SysMessage> {
    /**
    * 主键ID
    */
    @TableId(value = "message_id", type = IdType.AUTO)
    private Integer messageId;

    /**
    * 类型
    */
    private String type;

    /**
    * 标题
    */
    private String title;

    /**
    * 内容
    */
    private String content;

    /**
    * 发送范围 0全部 1指定
    */
    private String range;

    /**
    * 新创建账号推送
    */
    private String createSend;

    /**
    * 删除标识
    */
    private String delFlag;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 修改时间
    */
    private Date updateTime;

    /**
    * 修改人名称
    */
    private String updateBy;
}