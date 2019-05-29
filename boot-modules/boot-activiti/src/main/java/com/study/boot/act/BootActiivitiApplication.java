package com.study.boot.act;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author Qiu Hong Yun
 * @version 1.0
 * @date 2019/5/28 19:32
 */
@SpringCloudApplication
@EnableFeignClients(basePackages ={"com.study.boot"})
public class BootActiivitiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootActiivitiApplication.class,args);
    }
}
