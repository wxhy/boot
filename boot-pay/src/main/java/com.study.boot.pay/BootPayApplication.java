package com.study.boot.pay;


import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author Administrator
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableBootResourceServer
@EnableBootSwagger
public class BootPayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootPayApplication.class,args);
    }
}
