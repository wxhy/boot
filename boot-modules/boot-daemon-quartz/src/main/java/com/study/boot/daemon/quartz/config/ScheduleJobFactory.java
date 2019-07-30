package com.study.boot.daemon.quartz.config;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * 动态任务工厂
 *
 * @author carlos
 */
public class ScheduleJobFactory implements Job {


    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        System.out.println(122222);
    }
}
