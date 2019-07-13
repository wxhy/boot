package com.study.boot.pay.entitiy;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author Administrator
 */
@Data
@TableName(value = "pay_info")
@EqualsAndHashCode(callSuper = true)
public class PayInfo extends Model<PayInfo> {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 商品名称
     */
    @TableField(value = "name")
    private String name;

    /**
     * 支付编号
     */
    @TableField(value = "pay_no")
    private String payNo;

    /**
     * 金额
     */
    @TableField(value = "money")
    private BigDecimal money;

    /**
     * 商品编号
     */
    @TableField(value = "product_no")
    private String productNo;

    /**
     * 商品描述
     */
    @TableField(value = "remark")
    private String remark;

    /**
     * 状态
     */
    @TableField(value = "status")
    private String status;

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

}