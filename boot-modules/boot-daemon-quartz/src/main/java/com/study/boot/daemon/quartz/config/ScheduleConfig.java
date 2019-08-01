package com.study.boot.daemon.quartz.config;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import org.quartz.Calendar;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.quartz.QuartzProperties;
import org.springframework.boot.autoconfigure.quartz.SchedulerFactoryBeanCustomizer;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * @author carlos
 */
@Configuration
@ConditionalOnClass({Scheduler.class, SchedulerFactoryBean.class})
@EnableConfigurationProperties(QuartzProperties.class)
public class ScheduleConfig {

    private final QuartzProperties quartzProperties;

    private final List<SchedulerFactoryBeanCustomizer> customizers;

    private final JobDetail[] jobDetails;

    private final Map<String, Calendar> calendars;

    private final Trigger[] triggers;

    private final ApplicationContext applicationContext;


    public ScheduleConfig(QuartzProperties quartzProperties,
                          ObjectProvider<List<SchedulerFactoryBeanCustomizer>> customizers,
                          ObjectProvider<JobDetail[]> jobDetails,
                          ObjectProvider<Map<String, Calendar>> calendars,
                          ObjectProvider<Trigger[]> triggers,
                          ApplicationContext applicationContext) {
        this.quartzProperties = quartzProperties;
        this.customizers = customizers.getIfAvailable();
        this.jobDetails = jobDetails.getIfAvailable();
        this.calendars = calendars.getIfAvailable();
        this.triggers = triggers.getIfAvailable();
        this.applicationContext = applicationContext;
    }

    @Bean
    public SchedulerFactoryBean quartzScheduler() {
        SchedulerFactoryBean factoryBean = new SchedulerFactoryBean();
        factoryBean.setJobFactory(new AutowireCapableBeanJobFactory(this.applicationContext.getAutowireCapableBeanFactory()));
        if (!this.quartzProperties.getProperties().isEmpty()) {
            factoryBean.setQuartzProperties(this.asProperties(this.quartzProperties.getProperties()));
        }
        if (ArrayUtil.isNotEmpty(this.jobDetails)) {
            factoryBean.setJobDetails(this.jobDetails);
        }

        if (CollectionUtil.isNotEmpty(calendars)) {
            factoryBean.setCalendars(calendars);
        }
        if (ArrayUtil.isNotEmpty(triggers)) {
            factoryBean.setTriggers(triggers);
        }

        if (CollectionUtil.isNotEmpty(customizers)) {
            Iterator<SchedulerFactoryBeanCustomizer> iterator = customizers.iterator();
            while (iterator.hasNext()) {
                SchedulerFactoryBeanCustomizer customizer = iterator.next();
                customizer.customize(factoryBean);
            }
        }
        //延迟60秒执行任务，避免系统未完全启动却开始执行定时任务的情况
        factoryBean.setStartupDelay(10);
        factoryBean.setWaitForJobsToCompleteOnShutdown(true);

        return factoryBean;
    }

    public Properties asProperties(Map<String, String> sources) {
        Properties properties = new Properties();
        properties.putAll(sources);
        return properties;
    }


    /**
     * 初始化监听器
     *
     * @return
     */
    @Bean
    public QuartzInitializerListener executorListener() {
        return new QuartzInitializerListener();
    }

    /**
     * 通过SchedulerFactoryBean获取Scheduler的实例
     *
     * @return
     */
    @Bean
    public Scheduler scheduler() {
        return quartzScheduler().getScheduler();
    }
}
