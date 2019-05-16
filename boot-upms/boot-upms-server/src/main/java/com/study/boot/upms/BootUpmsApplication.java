package com.study.boot.upms;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 *
 * @author Administrator
 */
@EnableResourceServer
@EnableFeignClients
@SpringCloudApplication
public class BootUpmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootUpmsApplication.class,args);
    }
}
