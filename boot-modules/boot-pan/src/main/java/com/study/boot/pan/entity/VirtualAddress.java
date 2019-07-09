/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */
package com.study.boot.pan.generator.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
@Data
@TableName("virtual_address")
@EqualsAndHashCode(callSuper = true)
public class VirtualAddress extends Model<VirtualAddress> {
private static final long serialVersionUID = 1L;

    /**
   * 主键ID
   */
    @TableId
    private Long id;
    /**
   * 文件ID
   */
    private String fileId;
    /**
   * 上传文件名
   */
    private String fileName;
    /**
   * MD5
   */
    private String md5;
    /**
   * 父路径
   */
    private String parentPath;
    /**
   * 是否是文件夹
   */
    private String isDir;
    /**
   * 创建时间
   */
    private LocalDateTime createTime;
    /**
   * 修改时间
   */
    private LocalDateTime updateTime;
    /**
   * 状态
   */
    private String status;
  
}
