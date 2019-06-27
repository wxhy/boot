package com.study.boot.daemon;

import com.study.boot.common.job.annoation.EnableBootJob;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author Administrator
 */

@SpringCloudApplication
@EnableBootJob
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class BootDaemonApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootDaemonApplication.class,args);
    }
}
