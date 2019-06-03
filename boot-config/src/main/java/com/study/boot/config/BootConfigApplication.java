package com.study.boot.config;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/18 10:42
 */
@SpringCloudApplication
@EnableConfigServer
public class BootConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootConfigApplication.class,args);
    }
}
