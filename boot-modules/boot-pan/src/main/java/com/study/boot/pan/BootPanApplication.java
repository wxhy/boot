package com.study.boot.pan;

import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 *
 * @author Administrator
 */
@SpringCloudApplication
@EnableBootSwagger
@EnableBootResourceServer
@EnableAsync
public class BootPanApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootPanApplication.class,args);
    }
}
