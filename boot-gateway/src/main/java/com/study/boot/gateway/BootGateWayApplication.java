package com.study.boot.gateway;

import com.study.boot.common.gateway.annotation.EnableDynamicRoute;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * 
 * @author Carlos
 * @version 1.0
 * @date 2019/5/18 13:29
 */

@SpringCloudApplication
@EnableDynamicRoute
public class BootGateWayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootGateWayApplication.class,args);
    }

}
