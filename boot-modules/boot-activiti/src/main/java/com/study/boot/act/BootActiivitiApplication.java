package com.study.boot.act;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/28 19:32
 */
@SpringCloudApplication
@EnableFeignClients(basePackages ={"com.study.boot"})
@EnableResourceServer
public class BootActiivitiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootActiivitiApplication.class,args);
    }
}
