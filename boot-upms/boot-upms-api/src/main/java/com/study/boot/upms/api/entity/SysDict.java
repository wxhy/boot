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
 * 字典表
 * @author Administrator
 */
@ApiModel(value="字典表")
@Data
@TableName(value = "sys_dict")
public class SysDict extends Model<SysDict> {
    /**
     * 编号
     */
     @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="编号")
    private Integer id;

    /**
     * 数据值
     */
    @TableField(value = "value")
    @ApiModelProperty(value="数据值")
    private String value;

    /**
     * 标签名
     */
    @TableField(value = "label")
    @ApiModelProperty(value="标签名")
    private String label;

    /**
     * 类型
     */
    @TableField(value = "type")
    @ApiModelProperty(value="类型")
    private String type;

    /**
     * 描述
     */
    @TableField(value = "description")
    @ApiModelProperty(value="描述")
    private String description;

    /**
     * 排序（升序）
     */
    @TableField(value = "sort")
    @ApiModelProperty(value="排序（升序）")
    private Integer sort;

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
     * 备注信息
     */
    @TableField(value = "remarks")
    @ApiModelProperty(value="备注信息")
    private String remarks;

    /**
     * 删除标记
     */
    @TableField(value = "del_flag")
    @ApiModelProperty(value="删除标记")
    private String delFlag;

}