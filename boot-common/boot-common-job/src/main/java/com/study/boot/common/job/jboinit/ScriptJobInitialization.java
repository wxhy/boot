package com.study.boot.common.job.jboinit;

import com.dangdang.ddframe.job.api.JobType;
import com.dangdang.ddframe.job.config.JobCoreConfiguration;
import com.dangdang.ddframe.job.config.JobTypeConfiguration;
import com.dangdang.ddframe.job.config.script.ScriptJobConfiguration;
import com.study.boot.common.job.properties.ElasticJobProperties;

import java.util.Map;

/**
 * @author Administrator
 */
public class ScriptJobInitialization extends AbstractJobInitialization {

    private Map<String, ElasticJobProperties.ScriptConfiguration> scriptConfigurationMap;

    public ScriptJobInitialization(final Map<String, ElasticJobProperties.ScriptConfiguration> scriptConfigurationMap) {
        this.scriptConfigurationMap = scriptConfigurationMap;
    }

    public void init(){
        for (String jobName :scriptConfigurationMap.keySet() ) {
            ElasticJobProperties.ScriptConfiguration scriptConfiguration = scriptConfigurationMap.get(jobName);
            initJob(jobName, JobType.SCRIPT,scriptConfiguration);
        }
    }

    @Override
    public JobTypeConfiguration getJobTypeConfiguration(String jobName, JobCoreConfiguration jobCoreConfiguration) {
        ElasticJobProperties.ScriptConfiguration scriptConfiguration = scriptConfigurationMap.get(jobName);
        return new ScriptJobConfiguration(jobCoreConfiguration,scriptConfiguration.getScriptCommandLine());
    }


}
