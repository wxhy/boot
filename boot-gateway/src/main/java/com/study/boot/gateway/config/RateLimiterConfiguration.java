package com.study.boot.gateway.config;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import reactor.core.publisher.Mono;

/**
 * 路由限流处理
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/19 9:54
 */
@Configuration
public class RateLimiterConfiguration {

    @Bean(value = "remoteAddressKeyResolver")
    public KeyResolver remoteAddressKeyResolver(){
        return exchange -> Mono.just(exchange.getRequest().getRemoteAddress().getAddress().getHostAddress());
    }
}
