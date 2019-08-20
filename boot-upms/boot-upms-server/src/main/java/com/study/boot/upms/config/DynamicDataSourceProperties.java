package com.study.boot.upms.config;


import com.zaxxer.hikari.HikariDataSource;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 配置多个数据源
 * @author carlos
 */
@Slf4j
@Data
@ConfigurationProperties("spring.dynamic")
public class DynamicDataSourceProperties {

    private HikariDataSource master;

    private HikariDataSource slave;
}
