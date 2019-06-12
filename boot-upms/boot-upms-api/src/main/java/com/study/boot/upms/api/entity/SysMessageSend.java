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
public class SysMessageSend extends Model<SysMessageSend> {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer messageId;

    private Integer userId;

    /**
    * 标题
    */
    private String title;

    /**
    * 内容
    */
    private String content;

    /**
    * 类型
    */
    private String type;

    /**
    * 发送用户名
    */
    private String userName;

    /**
     * 是否已读
     */
    private String status;

    /**
    * 删除标识
    */
    private String delflag;

    /**
    * 创建人
    */
    private String createBy;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 修改人
    */
    private String updateBy;

    /**
    * 修改时间
    */
    private Date updateTime;
}