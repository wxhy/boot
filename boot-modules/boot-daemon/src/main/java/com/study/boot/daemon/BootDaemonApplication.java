package com.study.boot.daemon;

import com.study.boot.common.auth.annoation.EnableBootResourceServer;
import com.study.boot.common.job.annoation.EnableBootJob;
import com.study.boot.common.swagger.annoation.EnableBootSwagger;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author Administrator
 */

@SpringCloudApplication
@EnableBootJob
@EnableBootResourceServer
@EnableBootSwagger
public class BootDaemonApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootDaemonApplication.class,args);
    }
}
