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

package com.study.boot.daemon.controller;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.daemon.entity.ExecutionLog;
import com.study.boot.daemon.service.ExecutionLogService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * @author lengleng
 * @date 2018-08-03 22:15:56
 */
@RestController
@RequestMapping("/execution-log")
@AllArgsConstructor
@Api(tags = "任务日志管理")
public class ExecutionLogController {

	private final ExecutionLogService executionLogService;

	/**
	 * 任务日志处理简单分页查询
	 *
	 * @param page         分页对象
	 * @param executionLog 任务日志处理
	 * @return
	 */
	@GetMapping("/page")
	public WebResponse getExecutionLogPage(Page page, ExecutionLog executionLog) {
		return new WebResponse<>(executionLogService.page(page, Wrappers.query(executionLog)));
	}


	/**
	 * 通过id查询一条记录
	 *
	 * @param id
	 * @return R
	 */
	@GetMapping("/{id}")
	public WebResponse getById(@PathVariable("id") String id) {
		return new WebResponse<>(executionLogService.getById(id));
	}

	/**
	 * 保存
	 *
	 * @param executionLog
	 * @return R
	 */
	@PostMapping
	public WebResponse save(@RequestBody ExecutionLog executionLog) {
		return new WebResponse<>(executionLogService.save(executionLog));
	}

	/**
	 * 修改
	 *
	 * @param executionLog
	 * @return R
	 */
	@PutMapping
	public WebResponse update(@RequestBody ExecutionLog executionLog) {
		return new WebResponse<>(executionLogService.updateById(executionLog));
	}

	/**
	 * 删除
	 *
	 * @param id
	 * @return R
	 */
	@DeleteMapping("/{id}")
	public WebResponse removeById(@PathVariable String id) {
		return new WebResponse<>(executionLogService.removeById(id));
	}

}
