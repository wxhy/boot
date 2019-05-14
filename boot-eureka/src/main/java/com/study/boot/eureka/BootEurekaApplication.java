package com.study.boot.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * Eureka服务器
 * @author Administrator
 */

@SpringBootApplication
@EnableEurekaServer
public class BootEurekaApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootEurekaApplication.class, args);
    }

}
