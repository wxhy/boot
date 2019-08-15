package com.study.boot.act;

import com.study.boot.common.auth.annoation.EnableBootFeignClients;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/28 19:32
 */
@SpringCloudApplication
@EnableBootFeignClients
@EnableBootResourceServer
@EnableBootSwagger
public class BootActiivitiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootActiivitiApplication.class,args);
    }
}
