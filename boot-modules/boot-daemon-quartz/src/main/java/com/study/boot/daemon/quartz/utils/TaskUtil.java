package com.study.boot.daemon.quartz.utils;


import com.study.boot.daemon.quartz.config.ScheduleJobFactory;
import com.study.boot.daemon.quartz.entity.SysJob;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.stereotype.Component;

import static com.study.boot.daemon.quartz.enums.QuartzEnum.*;

/**
 * 定时任务工具类
 *
 * @author carlos
 */
@Slf4j
@Component
public class TaskUtil {

    /**
     * 获取定时任务唯一Key
     *
     * @param sysJob
     * @return
     */
    public JobKey getJobKey(SysJob sysJob) {
        return JobKey.jobKey(sysJob.getJobName(), sysJob.getJobGroup());
    }

    /**
     * 获取定时任务触发器cron的唯一key
     *
     * @param sysjob
     * @return
     */
    public TriggerKey getTriggerKey(SysJob sysjob) {
        return TriggerKey.triggerKey(sysjob.getJobName(), sysjob.getJobGroup());
    }

    /**
     * 添加或更新定时任务
     *
     * @param sysJob
     * @param scheduler
     */
    public void addOrUpdateJob(SysJob sysJob, Scheduler scheduler) {
        CronTrigger trigger = null;

        try {
            JobKey jobKey = this.getJobKey(sysJob);

            //获得触发器
            TriggerKey triggerKey = this.getTriggerKey(sysJob);
            trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

            CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(sysJob.getCronExpression());
            cronScheduleBuilder = this.handleCronScheduleMisfirePolicy(sysJob, cronScheduleBuilder);
            //判断触发器是否存在（如果存在说明之前运行过但是在当前被禁用了，如果不存在说明一次都没运行过）
            if (trigger == null) {
                JobDetail jobDetail = JobBuilder.newJob(ScheduleJobFactory.class).withIdentity(jobKey).build();
                //将任务信息添加到任务信息中
                jobDetail.getJobDataMap().put(SCHEDULE_JOB_KEY.getType(), sysJob);

                //创建触发器并将cron表达式对象给塞入
                trigger = TriggerBuilder.newTrigger().withIdentity(triggerKey).withSchedule(cronScheduleBuilder).build();

                //在调度器中将触发器和任务进行组合
                scheduler.scheduleJob(jobDetail,trigger);

            } else {
                //按照新的规则进行
                trigger = trigger.getTriggerBuilder().withSchedule(cronScheduleBuilder).build();

                //将任务信息更新到任务信息中
                trigger.getJobDataMap().put(SCHEDULE_JOB_KEY.getType(), sysJob);

                scheduler.rescheduleJob(triggerKey,trigger);
            }

            //如果任务状态为暂停
            if(sysJob.getJobStatus().equals(JOB_STATUS_NOT_RUNNING.getType())) {
                this.pauseJob(sysJob,scheduler);
            }

        } catch (SchedulerException e) {
            log.error("添加或更新定时任务，失败信息：{}", e.getMessage());
        }


    }


    /**
     * 暂停任务
     * @param sysJob
     * @param scheduler
     */
    public void pauseJob(SysJob sysJob,Scheduler scheduler) {
        try {
            if(scheduler != null) {
                scheduler.pauseJob(getJobKey(sysJob));
            }
        } catch (SchedulerException e) {
            log.error("暂停任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 恢复定时任务
     * @param sysJob
     * @param scheduler
     */
    public void resumeJob(SysJob sysJob,Scheduler scheduler) {
        try {
            if(scheduler != null) {
                scheduler.resumeJob(getJobKey(sysJob));
            }
        } catch (SchedulerException e) {
            log.error("恢复任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 删除定时任务
     * @param sysJob
     * @param scheduler
     */
    public void removeJob(SysJob sysJob,Scheduler scheduler) {
        try {
            if(scheduler != null) {
                //停止触发器
                scheduler.pauseTrigger(getTriggerKey(sysJob));

                //移除触发器
                scheduler.unscheduleJob(getTriggerKey(sysJob));

                //删除定时任务
                scheduler.deleteJob(getJobKey(sysJob));
            }
        } catch (SchedulerException e) {
            log.error("移除定时任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 启动全部暂停状态的定时任务
     * @param scheduler
     */
    public void startJobs(Scheduler scheduler) {
        try {
            if(scheduler != null) {
                scheduler.resumeAll();
            }
        } catch (SchedulerException e) {
            log.error("启动所有运行定时任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 停止所有运行定时任务
     *
     * @param scheduler
     */
    public void pauseJobs(Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.pauseAll();
            }
        } catch (Exception e) {
            log.error("暂停所有运行定时任务失败，失败信息：{}", e.getMessage());
        }
    }


    /**
     * 获取错失执行策略方法
     *
     * @param sysJob
     * @param cronScheduleBuilder
     * @return
     */
    public CronScheduleBuilder handleCronScheduleMisfirePolicy(SysJob sysJob, CronScheduleBuilder cronScheduleBuilder) {
        if (MISFIRE_DEFAULT.getType().equals(sysJob.getMisfirePolicy())) {
            return cronScheduleBuilder;
        } else if (MISFIRE_IGNORE_MISFIRES.getType().equals(sysJob.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionIgnoreMisfires();
        } else if (MISFIRE_FIRE_AND_PROCEED.getType().equals(sysJob.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionFireAndProceed();
        } else if (MISFIRE_DO_NOTHING.getType().equals(sysJob.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionDoNothing();
        } else {
            return cronScheduleBuilder;
        }
    }


    /**
     * 判断cron表达式是否正确
     *
     * @param cronExpression
     * @return
     */
    public boolean isValidCron(String cronExpression) {
        return CronExpression.isValidExpression(cronExpression);
    }
}
