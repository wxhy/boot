package com.study.boot.common.datasource.config;

import com.study.boot.common.datasource.support.DataSourceContants;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author carlos
 */
@Configuration
public class DataSourceConfig {

    private final Map<Object, Object> dataSourceMap = new HashMap<>(8);

    @Bean
    @ConfigurationProperties("spring.datasource.master")
    @RefreshScope
    public DataSource masterDataSource(){
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties("spring.datasource.slave")
    @RefreshScope
    public DataSource slaveDataSource(){
        return DataSourceBuilder.create().build();
    }

    @Bean
    public DataSource dynamicDataSource(){
        dataSourceMap.put(DataSourceContants.MASTER,masterDataSource());
        dataSourceMap.put(DataSourceContants.SLAVE,slaveDataSource());
        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        dynamicDataSource.setDefaultTargetDataSource(masterDataSource());
        dynamicDataSource.setTargetDataSources(dataSourceMap);
        return dynamicDataSource;
    }
}
