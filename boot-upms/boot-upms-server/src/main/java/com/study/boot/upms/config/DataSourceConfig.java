package com.study.boot.upms.config;

import com.study.boot.upms.support.DataSourceContants;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.transaction.ChainedTransactionManager;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author carlos
 */
@Configuration
public class DataSourceConfig implements TransactionManagementConfigurer {

    private final Map<Object, Object> dataSourceMap = new HashMap<>(8);

    @Bean
    @ConfigurationProperties("spring.datasource.master")
    @RefreshScope
    public DataSource masterDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties("spring.datasource.slave")
    @RefreshScope
    public DataSource slaveDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @Primary
    public DataSource dynamicDataSource() {
        dataSourceMap.put(DataSourceContants.MASTER, masterDataSource());
        dataSourceMap.put(DataSourceContants.SLAVE, slaveDataSource());
        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        dynamicDataSource.setDefaultTargetDataSource(masterDataSource());
        dynamicDataSource.setTargetDataSources(dataSourceMap);
        dynamicDataSource.afterPropertiesSet();
        return dynamicDataSource;
    }

    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        DataSourceTransactionManager transactionManager
                = new DataSourceTransactionManager(dynamicDataSource());
        return new ChainedTransactionManager(transactionManager);
    }
}
