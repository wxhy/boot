package com.study.boot.daemon.quartz;


import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author carlos
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableBootResourceServer
@EnableBootSwagger
@EnableFeignClients(basePackages = {"com.study.boot"})
public class BootDaemonQuartzApplication {


    public static void main(String[] args) {
        SpringApplication.run(BootDaemonQuartzApplication.class,args);
    }
}
