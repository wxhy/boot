package com.study.boot.auth;

import com.study.boot.common.auth.annoation.EnableBootFeignClients;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 *
 * @author Administrator
 */
@SpringCloudApplication
@EnableBootSwagger
@EnableBootFeignClients
public class BootAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootAuthApplication.class, args);
    }

}
