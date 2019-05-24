package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 部门表
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysDept extends Model<SysDept> {
    /**
     * 部门ID
     */
    @TableId(value = "dept_id", type = IdType.AUTO)
    private Integer deptId;

    /**
     * 部门名称
     */
    @NotBlank(message = "部门名称不能为空")
    private String name;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

    /**
     * 是否删除  -1：已删除  0：正常
     */
    private String delFlag;

    private Integer parentId;
}