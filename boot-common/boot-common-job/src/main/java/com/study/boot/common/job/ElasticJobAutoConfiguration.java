package com.study.boot.common.job;

import com.dangdang.ddframe.job.reg.zookeeper.ZookeeperConfiguration;
import com.dangdang.ddframe.job.reg.zookeeper.ZookeeperRegistryCenter;
import com.study.boot.common.job.jboinit.DataflowJobInitialization;
import com.study.boot.common.job.jboinit.ScriptJobInitialization;
import com.study.boot.common.job.jboinit.SimpleJobInitialization;
import com.study.boot.common.job.properties.ElasticJobProperties;
import com.ulisesbocchio.jasyptspringboot.annotation.ConditionalOnMissingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 任务配置类入口
 * @author Administrator
 */

@Configuration
@EnableAutoConfiguration
@EnableConfigurationProperties(ElasticJobProperties.class)
public class ElasticJobAutoConfiguration {


    /**
     * 默认注册中心
     */
    public static final String DEFAULT_REGISTRY_CENTER_NAME = "elasticJobRegistryCenter";

    @Autowired
    private ElasticJobProperties elasticJobProperties;

    @Bean(name = DEFAULT_REGISTRY_CENTER_NAME,initMethod = "init")
    @ConditionalOnMissingBean
    public ZookeeperRegistryCenter elasticJobRegistryCenter(){
        ElasticJobProperties.ZkConfiguration zkConfiguration = elasticJobProperties.getZookeeper();
        ZookeeperConfiguration zookeeperConfiguration = new ZookeeperConfiguration(zkConfiguration.getServerLists(), zkConfiguration.getNamespace());
        zookeeperConfiguration.setBaseSleepTimeMilliseconds(zkConfiguration.getBaseSleepTimeMilliseconds());
        zookeeperConfiguration.setConnectionTimeoutMilliseconds(zkConfiguration.getConnectionTimeoutMilliseconds());
        zookeeperConfiguration.setDigest(zkConfiguration.getDigest());
        zookeeperConfiguration.setMaxRetries(zkConfiguration.getMaxRetries());
        zookeeperConfiguration.setMaxSleepTimeMilliseconds(zkConfiguration.getMaxSleepTimeMilliseconds());
        zookeeperConfiguration.setSessionTimeoutMilliseconds(zkConfiguration.getSessionTimeoutMilliseconds());
        return new ZookeeperRegistryCenter(zookeeperConfiguration);
    }

    @Bean(name = "simpleJobInitialization",initMethod = "init")
    @ConditionalOnBean(ZookeeperRegistryCenter.class)
    @ConditionalOnMissingBean
    public SimpleJobInitialization simpleJobConfiguration(){
        return new SimpleJobInitialization(elasticJobProperties.getSimples());
    }


    @Bean(name = "dataflowJobInitialization",initMethod = "init")
    @ConditionalOnBean(ZookeeperRegistryCenter.class)
    @ConditionalOnMissingBean
    public DataflowJobInitialization dataflowJobInitialization(){
        return new DataflowJobInitialization(elasticJobProperties.getDataflows());
    }

    @Bean(name = "scriptJobInitialization",initMethod = "init")
    @ConditionalOnBean(ZookeeperRegistryCenter.class)
    @ConditionalOnMissingBean
    public ScriptJobInitialization scriptJobInitialization(){
        return new ScriptJobInitialization(elasticJobProperties.getScripts());
    }



}
