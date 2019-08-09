package com.study.boot.monitor;


import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 *
 * @author carlos
 */
@SpringBootApplication
@EnableAdminServer
public class BootMonitorApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootMonitorApplication.class,args);
    }
}
