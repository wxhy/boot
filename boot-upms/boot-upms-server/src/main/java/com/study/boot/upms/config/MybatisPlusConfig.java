package com.study.boot.upms.config;

import com.study.boot.upms.plugins.MasterSlaveAutoRoutingPlugin;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author carlos
 */
@Configuration
public class MybatisPlusConfig {

    /**
     * 数据源切换Mybatis插件
     * @return
     */
    @Bean
    public MasterSlaveAutoRoutingPlugin masterSlaveAutoRoutingPlugin(){
        return new MasterSlaveAutoRoutingPlugin();
    }
}
