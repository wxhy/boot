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
public class SysSocialDetails extends Model<SysSocialDetails> {
    /**
    * 主鍵
    */
    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer id;

    /**
    * 类型
    */
    private String type;

    /**
    * 描述
    */
    private String remark;

    /**
    * appid
    */
    private String appId;

    /**
    * app_secret
    */
    private String appSecret;

    /**
    * 回调地址
    */
    private String redirectUrl;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 更新时间
    */
    private Date updateTime;

    /**
    * 删除标记
    */
    private String delFlag;
}