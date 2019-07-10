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
package com.study.boot.pan.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 文件表
 *
 * @author code generator
 * @date 2019-07-09 17:40:21
 */
@Data
@TableName("sys_file")
@EqualsAndHashCode(callSuper = true)
public class SysFile extends Model<SysFile> {
private static final long serialVersionUID = 1L;

    /**
   * 主键ID
   */
    @TableId
    private String fileId;
    /**
   * 文件名称
   */
    private String fileName;
    /**
   * 文件大小
   */
    private Long fileSize;
    /**
   * 文件类型
   */
    private String fileType;
    /**
   * 文件路径
   */
    private String filePath;
    /**
   * MD5
   */
    private String md5;
    /**
   * 创建时间
   */
    private LocalDateTime createTime;
  
}
