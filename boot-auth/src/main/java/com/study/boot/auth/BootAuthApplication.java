package com.study.boot.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 *
 * @author Administrator
 */
@SpringCloudApplication
@EnableFeignClients(basePackages = {"com.study.boot"})
public class BootAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootAuthApplication.class, args);
    }
}
