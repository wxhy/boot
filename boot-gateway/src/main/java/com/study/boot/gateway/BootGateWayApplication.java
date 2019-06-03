package com.study.boot.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

/**
 * 
 * @author Carlos
 * @version 1.0
 * @date 2019/5/18 13:29
 */

@SpringCloudApplication
public class BootGateWayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootGateWayApplication.class,args);
    }

}
