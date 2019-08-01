package com.study.boot.daemon.quartz.event;

import com.study.boot.daemon.quartz.service.SysJobLogService;
import com.study.boot.daemon.quartz.utils.TaskInvokeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * @author frwcloud
 * @date 2018/6/28
 * <p>
 * 多线程自动配置
 */
@EnableAsync
@Configuration
@ConditionalOnWebApplication
public class EventAutoConfiguration {

    @Autowired
    private TaskInvokeUtil taskInvokeUtil;
    @Autowired
    private SysJobLogService sysJobLogService;

    @Bean
    public SysJobListener sysJobListener() {
        return new SysJobListener(taskInvokeUtil);
    }

    @Bean
    public SysJobLogListener sysJobLogListener() {
        return new SysJobLogListener(sysJobLogService);
    }

    @Bean
    public TaskInvokeUtil taskInvokUtil(ApplicationEventPublisher publisher) {
        return new TaskInvokeUtil(publisher);
    }

}
