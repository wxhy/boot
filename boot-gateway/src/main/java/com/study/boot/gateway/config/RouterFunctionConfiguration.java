package com.study.boot.gateway.config;

import com.study.boot.gateway.handler.HystrixFallbackHandler;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;

/**
 * 路由配置信息
 * @author Administrator
 */
@Configuration
@AllArgsConstructor
public class RouterFunctionConfiguration {

    private final HystrixFallbackHandler hystrixFallbackHandler;
    @Bean
    public RouterFunction  routerFunction(){
        return RouterFunctions.route(
                RequestPredicates.path("/fallback")
                .and(RequestPredicates.accept(MediaType.TEXT_PLAIN)),hystrixFallbackHandler);
    }
}
