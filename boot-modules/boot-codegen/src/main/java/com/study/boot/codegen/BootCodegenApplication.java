package com.study.boot.codegen;


import com.study.boot.common.auth.annoation.EnableBootFeignClients;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * 代码生成
 * @author Administrator
 */
@SpringCloudApplication
@EnableBootResourceServer
@EnableBootSwagger
@EnableBootFeignClients
public class BootCodegenApplication {


    public static void main(String[] args) {
        SpringApplication.run(BootCodegenApplication.class,args);
    }
}
