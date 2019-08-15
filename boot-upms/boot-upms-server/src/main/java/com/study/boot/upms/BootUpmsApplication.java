package com.study.boot.upms;

import com.study.boot.common.auth.annoation.EnableBootFeignClients;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 *
 * @author Administrator
 */

@EnableBootFeignClients
@SpringCloudApplication
@EnableBootSwagger
@EnableBootResourceServer
public class BootUpmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootUpmsApplication.class,args);
    }
}
