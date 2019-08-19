package com.study.boot.upms.config;


import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.gateway.support.DynamicRouteInitEvent;
import com.study.boot.common.gateway.vo.RouteDefinitionVo;
import com.study.boot.upms.service.SysRouteConfService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.scheduling.annotation.Async;

import java.net.URI;

/**
 *
 *
 * @author
 */
@Slf4j
@Configuration
@AllArgsConstructor
public class DynamicRouteInitRunner {

    private final RedisTemplate redisTemplate;
    private final SysRouteConfService sysRouteConfService;

    @Async
    @Order
    @EventListener({ApplicationStartedEvent.class, DynamicRouteInitEvent.class})
    public void initRoute(){
        //清空redis缓存的路由
        Boolean result = redisTemplate.delete(CommonConstants.ROUTE_KEY);
        log.info("初始化网关路由 {} ",result);


        sysRouteConfService.routes().forEach(route->{
            RouteDefinitionVo vo = new RouteDefinitionVo();
            vo.setRouteName(route.getRouteName());
            vo.setId(route.getRouteId());
            vo.setUri(URI.create(route.getUri()));
            vo.setOrder(route.getOrder());
            JSONArray filterArray = JSONUtil.parseArray(route.getFilters());
            vo.setFilters(filterArray.toList(FilterDefinition.class));
            JSONArray predicatesObj = JSONUtil.parseArray(route.getPredicates());
            vo.setPredicates(predicatesObj.toList(PredicateDefinition.class));

            log.info("加载路由ID：{},{}", route.getRouteId(),vo);
            redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(RouteDefinitionVo.class));
            redisTemplate.opsForHash().put(CommonConstants.ROUTE_KEY,route.getRouteId(),vo);
        });

        log.debug("初始化网关路由结束");

    }


}
