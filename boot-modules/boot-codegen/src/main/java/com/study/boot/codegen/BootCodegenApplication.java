package com.study.boot.codegen;


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
public class BootCodegenApplication {


    public static void main(String[] args) {
        SpringApplication.run(BootCodegenApplication.class,args);
    }
}
