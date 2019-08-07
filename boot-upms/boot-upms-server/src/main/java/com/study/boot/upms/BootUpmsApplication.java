package com.study.boot.upms;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 *
 * @author Administrator
 */

@EnableFeignClients
@SpringCloudApplication
@EnableBootSwagger
@EnableBootResourceServer
@EnableDistributedTransaction
public class BootUpmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootUpmsApplication.class,args);
    }
}
