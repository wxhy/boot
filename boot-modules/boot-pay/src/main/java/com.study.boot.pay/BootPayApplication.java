package com.study.boot.pay;


import com.study.boot.common.auth.annoation.EnableBootFeignClients;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author Administrator
 */
@SpringCloudApplication
@EnableBootResourceServer
@EnableBootSwagger
@EnableBootFeignClients
public class BootPayApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootPayApplication.class,args);
    }
}
