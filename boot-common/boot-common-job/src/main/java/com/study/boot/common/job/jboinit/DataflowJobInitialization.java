package com.study.boot.common.job.jboinit;

import com.dangdang.ddframe.job.config.JobCoreConfiguration;
import com.dangdang.ddframe.job.config.JobTypeConfiguration;
import com.dangdang.ddframe.job.config.dataflow.DataflowJobConfiguration;
import com.study.boot.common.job.properties.ElasticJobProperties;

import java.util.Map;

/**
 * @author Administrator
 */
public class DataflowJobInitialization extends AbstractJobInitialization {

    private Map<String, ElasticJobProperties.DataflowConfiguration> dataflowConfigurationMap;

    public DataflowJobInitialization(Map<String, ElasticJobProperties.DataflowConfiguration> dataflowConfigurationMap) {
        this.dataflowConfigurationMap = dataflowConfigurationMap;
    }

    public void init(){
        for (String jobName : dataflowConfigurationMap.keySet()) {
            ElasticJobProperties.DataflowConfiguration dataflowConfiguration = dataflowConfigurationMap.get(jobName);
            initJob(jobName, dataflowConfiguration.getJobType(), dataflowConfiguration);
        }
    }

    @Override
    public JobTypeConfiguration getJobTypeConfiguration(String jobName, JobCoreConfiguration jobCoreConfiguration) {
        ElasticJobProperties.DataflowConfiguration dataflowConfiguration = dataflowConfigurationMap.get(jobName);
        return new DataflowJobConfiguration(jobCoreConfiguration,dataflowConfiguration.getJobClass(),dataflowConfiguration.isStreamingProcess());
    }
}
