package com.study.boot.common.gateway.configuration;


import org.springframework.cloud.gateway.config.GatewayProperties;
import org.springframework.cloud.gateway.config.PropertiesRouteDefinitionLocator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 动态路由配置表
 * @author carlos
 */
@Configuration
@ComponentScan("com.study.boot.common.gateway")
public class DynamicRouteAutoConfiguration {


    /**
     * 配置文件设置路由为空，不从配置文件获取路由
     * @return
     */
    @Bean
    public PropertiesRouteDefinitionLocator propertiesRouteDefinitionLocator(){
        return new PropertiesRouteDefinitionLocator(new GatewayProperties());
    }
}
