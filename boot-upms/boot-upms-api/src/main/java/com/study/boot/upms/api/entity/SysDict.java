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
@TableName(value = "sys_dict")
public class SysDict extends Model<SysDict> {
    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 数据值
     */
    @TableField(value = "value")
    private String value;

    /**
     * 标签名
     */
    @TableField(value = "label")
    private String label;

    /**
     * 类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 描述
     */
    @TableField(value = "description")
    private String description;

    /**
     * 排序（升序）
     */
    @TableField(value = "sort")
    private Integer sort;

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
     * 备注信息
     */
    @TableField(value = "remarks")
    private String remarks;

    /**
     * 删除标记
     */
    @TableField(value = "del_flag")
    private String delFlag;

    public static final String COL_VALUE = "value";

    public static final String COL_LABEL = "label";

    public static final String COL_TYPE = "type";

    public static final String COL_DESCRIPTION = "description";

    public static final String COL_SORT = "sort";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_REMARKS = "remarks";

    public static final String COL_DEL_FLAG = "del_flag";
}