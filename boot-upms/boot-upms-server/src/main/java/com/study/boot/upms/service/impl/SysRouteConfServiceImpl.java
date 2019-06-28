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

package com.study.boot.upms.service.impl;

import cn.hutool.json.JSONArray;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.upms.api.entity.SysRouteConf;
import com.study.boot.upms.mapper.SysRouteConfMapper;
import com.study.boot.upms.service.SysRouteConfService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import java.util.List;

/**
 * @author lengleng
 * @date 2018年11月06日10:27:55
 * <p>
 * 动态路由处理类
 */
@Slf4j
@AllArgsConstructor
@Service("sysRouteConfService")
public class SysRouteConfServiceImpl extends ServiceImpl<SysRouteConfMapper, SysRouteConf> implements SysRouteConfService {

	/**
	 * 获取全部路由
	 * <p>
	 * RedisRouteDefinitionWriter.java
	 * PropertiesRouteDefinitionLocator.java
	 *
	 * @return
	 */
	@Override
	public List<SysRouteConf> routes() {
		return baseMapper.selectList(Wrappers.emptyWrapper());
	}

	/**
	 * 更新路由信息
	 *
	 * @param routes 路由信息
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public Mono<Void> updateRoutes(JSONArray routes) {

		// 逻辑删除全部
		SysRouteConf condition = new SysRouteConf();
		condition.setDelFlag(CommonConstants.STATUS_NORMAL);
		this.remove(Wrappers.query(condition));

		//插入生效路由
//		List<SysRouteConf> routeConfList = routeDefinitionVoList.stream().map(vo -> {
//			SysRouteConf routeConf = new SysRouteConf();
//			routeConf.setRouteId(vo.getId());
//			routeConf.setRouteName(vo.getRouteName());
//			routeConf.setFilters(JSONUtil.toJsonStr(vo.getFilters()));
//			routeConf.setPredicates(JSONUtil.toJsonStr(vo.getPredicates()));
//			routeConf.setOrder(vo.getOrder());
//			routeConf.setUri(vo.getUri().toString());
//			return routeConf;
//		}).collect(Collectors.toList());
//		this.saveBatch(routeConfList);
		log.debug("更新网关路由结束 ");

		return Mono.empty();
	}

}
