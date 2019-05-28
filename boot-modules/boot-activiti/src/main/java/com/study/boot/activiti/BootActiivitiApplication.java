package com.study.boot.activiti;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/28 19:32
 */
@SpringBootApplication
@EnableDiscoveryClient
public class BootActiivitiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootActiivitiApplication.class,args);
    }
}
