package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_dict")
public class SysDict extends Model<SysDict> {
    public static final String COL_VALUE = "value";
    public static final String COL_LABEL = "label";
    public static final String COL_SORT = "sort";
    /**
     * 编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private Date updateTime;

    /**
     * 描述
     */
    @TableField(value = "description")
    private String description;

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

    public static final String COL_TYPE = "type";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_DESCRIPTION = "description";

    public static final String COL_REMARKS = "remarks";

    public static final String COL_DEL_FLAG = "del_flag";
}