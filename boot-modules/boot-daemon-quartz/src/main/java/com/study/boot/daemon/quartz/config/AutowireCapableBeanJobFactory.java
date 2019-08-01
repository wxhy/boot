package com.study.boot.daemon.quartz.config;

import cn.hutool.core.lang.Assert;
import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

/**
 *
 * 为JobFactory注入SpringBean,否则Job无法使用Spring创建的bean
 *
 * @author carlos
 */
public class AutowireCapableBeanJobFactory extends SpringBeanJobFactory {

    private AutowireCapableBeanFactory beanFactory;


    AutowireCapableBeanJobFactory(AutowireCapableBeanFactory beanFactory) {
        Assert.notNull(beanFactory, "Bean factory must not be null");
        this.beanFactory = beanFactory;
    }


    @Override
    protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {
        Object jobInstance = super.createJobInstance(bundle);
        this.beanFactory.autowireBean(jobInstance);
        this.beanFactory.initializeBean(jobInstance,(String) null);
        return jobInstance;
    }
}
