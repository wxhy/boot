package com.study.boot.daemon.quartz.config;

import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.event.SysJobEvent;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;

import static com.study.boot.daemon.quartz.enums.QuartzEnum.SCHEDULE_JOB_KEY;

/**
 * 动态任务工厂
 *
 *  禁止并发执行相同定义的JobDetail
 * @author carlos
 */
@Slf4j
@DisallowConcurrentExecution
public class ScheduleJobFactory implements Job {

    @Autowired
    private ApplicationEventPublisher publisher;


    @Override
    @SneakyThrows
    public void execute(JobExecutionContext context) {
        SysJob sysJob = (SysJob) context.getMergedJobDataMap().get(SCHEDULE_JOB_KEY.getType());
        publisher.publishEvent(new SysJobEvent(sysJob,context.getTrigger()));
    }
}
