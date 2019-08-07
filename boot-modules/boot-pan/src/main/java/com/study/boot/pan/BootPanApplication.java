package com.study.boot.pan;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;
import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author Administrator
 */
@SpringCloudApplication
@EnableBootSwagger
@EnableBootResourceServer
@EnableDistributedTransaction
@EnableFeignClients(basePackages = {"com.study.boot"})
public class BootPanApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootPanApplication.class, args);
    }
}
