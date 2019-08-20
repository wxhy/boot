package com.study.boot.common.datasource;


import com.study.boot.common.datasource.config.DynamicDataSource;
import com.study.boot.common.datasource.support.DataSourceContants;
import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * 动态配置数据源
 *
 * @author carlos
 */
@Slf4j
@Configuration
@AllArgsConstructor
@AutoConfigureBefore(DataSourceAutoConfiguration.class)
public class DynamicDataSourceAutoConfiguration{
    private final Map<Object, Object> dataSourceMap = new HashMap<>(8);


    @Bean
    @ConfigurationProperties("spring.dynamic.master")
    public DataSource masterDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    @Bean
    @ConfigurationProperties("spring.dynamic.slave")
    public DataSource slaveDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }


    @Bean
    @Primary
    public DataSource dynamicDataSource() {
        dataSourceMap.put(DataSourceContants.MASTER.getValue(), masterDataSource());
        dataSourceMap.put(DataSourceContants.SLAVE.getValue(), slaveDataSource());
        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        dynamicDataSource.setDefaultTargetDataSource(masterDataSource());
        dynamicDataSource.setTargetDataSources(dataSourceMap);

        return dynamicDataSource;
    }

}
