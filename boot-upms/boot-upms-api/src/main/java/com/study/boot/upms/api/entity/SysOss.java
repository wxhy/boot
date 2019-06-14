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
 *
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys-oss")
public class SysOss extends Model<SysOss> {
     @TableId(value = "id", type = IdType.INPUT)
    private Long id;

    /**
     * 原文件名称
     */
    @TableField(value = "name")
    private String name;

    /**
     * 存储文件名
     */
    @TableField(value = "fkey")
    private String fkey;

    /**
     * 文件大小
     */
    @TableField(value = "size")
    private Long size;

    /**
     * 文件类型
     */
    @TableField(value = "type")
    private String type;

    /**
     * 创建人
     */
    @TableField(value = "crate_by")
    private String crateBy;

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

    /**
     * 删除状态
     */
    @TableField(value = "delFlag")
    private String delflag;

    public static final String COL_NAME = "name";

    public static final String COL_FKEY = "fkey";

    public static final String COL_SIZE = "size";

    public static final String COL_TYPE = "type";

    public static final String COL_CRATE_BY = "crate_by";

    public static final String COL_CREATE_TIME = "create_time";

    public static final String COL_UPDATE_BY = "update_by";

    public static final String COL_UPDATE_TIME = "update_time";

    public static final String COL_DELFLAG = "delFlag";
}