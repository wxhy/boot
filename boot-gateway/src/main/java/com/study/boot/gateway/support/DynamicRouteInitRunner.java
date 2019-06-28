package com.study.boot.gateway.support;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.gateway.vo.RouteDefinitionVo;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.stereotype.Component;

import java.net.URI;

/**
 * @author Administrator
 */
@Component
@Slf4j
public class DynamicRouteInitRunner implements CommandLineRunner {

    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    @SneakyThrows
    public void run(String... args) {
        remoteUserService.routes().getData().forEach(route -> {
            RouteDefinitionVo vo = new RouteDefinitionVo();
            vo.setRouteName(route.getRouteName());
            vo.setId(route.getRouteId());
            vo.setUri(URI.create(route.getUri()));
            vo.setOrder(route.getOrder());

            JSONArray filterObj = JSONUtil.parseArray(route.getFilters());
            vo.setFilters(filterObj.toList(FilterDefinition.class));
            JSONArray predicateObj = JSONUtil.parseArray(route.getPredicates());
            vo.setPredicates(predicateObj.toList(PredicateDefinition.class));

            log.info("加载路由ID：{},{}", route.getRouteId(), vo);
            redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(RouteDefinitionVo.class));
            redisTemplate.opsForHash().put(CommonConstants.ROUTE_KEY, route.getRouteId(), vo);

        });
    }
}
