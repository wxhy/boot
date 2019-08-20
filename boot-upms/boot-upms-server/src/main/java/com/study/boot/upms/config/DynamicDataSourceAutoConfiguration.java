package com.study.boot.upms.config;


import com.study.boot.upms.support.DataSourceContants;
import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * 动态配置数据源
 * @author carlos
 */
@Slf4j
@Configuration
@EnableConfigurationProperties(DynamicDataSourceProperties.class)
@AllArgsConstructor
public class DynamicDataSourceAutoConfiguration  {
    private final Map<Object, Object> dataSourceMap = new HashMap<>(8);
    private final DynamicDataSourceProperties dynamicDataSourceProperties;


    


    @Bean
    @Primary
    public DataSource dynamicDataSource() {
        dataSourceMap.put(DataSourceContants.MASTER.getValue(), dynamicDataSourceProperties.getMaster());
        dataSourceMap.put(DataSourceContants.SLAVE.getValue(), dynamicDataSourceProperties.getSlave());
        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        dynamicDataSource.setDefaultTargetDataSource(dynamicDataSourceProperties.getMaster());
        dynamicDataSource.setTargetDataSources(dataSourceMap);

        return dynamicDataSource;
    }

//    @Override
//    public PlatformTransactionManager annotationDrivenTransactionManager() {
//        DataSourceTransactionManager transactionManager
//                = new DataSourceTransactionManager(dynamicDataSource());
//        return new ChainedTransactionManager(transactionManager);
//    }
}
