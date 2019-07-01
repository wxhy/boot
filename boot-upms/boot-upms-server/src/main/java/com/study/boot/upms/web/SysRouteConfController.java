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

package com.study.boot.upms.web;

import cn.hutool.json.JSONArray;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.service.SysRouteConfService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 路由
 *
 * @author
 * @date 2018-11-06 10:17:18
 */
@RestController
@AllArgsConstructor
@RequestMapping("/route")
@Api(tags = "动态路由管理模块")
public class SysRouteConfController {
	private final SysRouteConfService sysRouteConfService;


	/**
	 * 获取当前定义的路由信息
	 *
	 * @return
	 */
	@GetMapping
	public WebResponse listRoutes() {
		return new WebResponse<>(sysRouteConfService.list());
	}

	/**
	 * 修改路由
	 *
	 * @param routes 路由定义
	 * @return
	 */
	@SysLog("修改路由")
	@PutMapping
	public WebResponse updateRoutes(@RequestBody JSONArray routes) {
		return new WebResponse(sysRouteConfService.updateRoutes(routes));
	}

}
