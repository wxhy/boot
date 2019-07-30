package com.study.boot.daemon.quartz.utils;

import cn.hutool.core.util.StrUtil;
import com.study.boot.common.util.SpringContextHolder;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.entity.SysJobLog;
import com.study.boot.daemon.quartz.enums.JobTypeQuartzEnum;
import com.study.boot.daemon.quartz.enums.QuartzEnum;
import com.study.boot.daemon.quartz.event.SysJobLogEvent;
import com.study.boot.daemon.quartz.exception.TaskException;
import com.study.boot.daemon.quartz.service.SysJobService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Trigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import java.time.ZoneId;
import java.util.Date;

/**
 * @author carlos
 */

@Slf4j
@Component
@RequiredArgsConstructor
public class TaskInvokeUtil {

    private final ApplicationEventPublisher publisher;

    @Autowired
    private SysJobService sysJobService;

    @SneakyThrows
    public void invoke(SysJob sysJob, Trigger trigger) {
        ITaskInvoke taskInvoke;

        //开始时间
        long startTime = System.currentTimeMillis();

        //结束时间
        long endTime;

        //更新定时任务表内的状态、执行时间、上次执行时间、下次执行时间等信息
        SysJob updateJob = new SysJob();
        updateJob.setJobId(sysJob.getJobId());

        //执行任务日志
        SysJobLog sysJobLog = new SysJobLog();
        sysJobLog.setJobId(sysJob.getJobId());
        sysJobLog.setJobName(sysJob.getJobName());
        sysJobLog.setJobGroup(sysJob.getJobGroup());
        sysJobLog.setJobOrder(sysJob.getJobOrder());
        sysJobLog.setJobType(sysJob.getJobType());
        sysJobLog.setExecutePath(sysJob.getExecutePath());
        sysJobLog.setClassName(sysJob.getClassName());
        sysJobLog.setMethodName(sysJob.getMethodName());
        sysJobLog.setMethodParamsValue(sysJob.getMethodParamsValue());
        sysJobLog.setCronExpression(sysJob.getCronExpression());

        try {
            if (StrUtil.isEmpty(sysJob.getJobType())) {
                log.info("定时任务类型无对应反射方式，反射类型为空");
                throw new TaskException("定时任务类型无对应反射方式，反射类型为空");
            }

            if (sysJob.getJobType().equals(JobTypeQuartzEnum.JAR.getType())) {
                taskInvoke = SpringContextHolder.getBean("jarTaskInvoke");
            } else if (sysJob.getJobType().equals(JobTypeQuartzEnum.JAVA.getType())) {
                taskInvoke = SpringContextHolder.getBean("javaClassTaskInvok");
            } else if (sysJob.getJobType().equals(JobTypeQuartzEnum.REST.getType())) {
                taskInvoke = SpringContextHolder.getBean("restTaskInvoke");
            } else if (sysJob.getJobType().equals(JobTypeQuartzEnum.SPRING_BEAN.getType())) {
                taskInvoke = SpringContextHolder.getBean("springBeanTaskInvoke");
            } else {
                log.info("定时任务类型无对应反射方式，反射类型:{}", sysJob.getJobType());
                throw new TaskException("定时任务类型无对应反射方式");
            }

            taskInvoke.invokMethod(sysJob);

            endTime = System.currentTimeMillis();
            sysJobLog.setJobMessage(QuartzEnum.JOB_LOG_STATUS_SUCCESS.getDescription());
            sysJobLog.setJobLogStatus(QuartzEnum.JOB_LOG_STATUS_SUCCESS.getType());
            sysJobLog.setExecuteTime(String.valueOf(endTime - startTime));


            //任务表信息更新
            updateJob.setJobExecuteStatus(QuartzEnum.JOB_LOG_STATUS_SUCCESS.getType());
            updateJob.setStartTime(trigger.getStartTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
            updateJob.setPreviousTime(trigger.getPreviousFireTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
            updateJob.setNextTime(trigger.getNextFireTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());

        } catch (Throwable e) {
            //获取执行结束时间
            endTime = System.currentTimeMillis();
            log.error("定时任务执行失败，任务名称：{}；任务组名：{}，cron执行表达式：{}，执行时间：{}", sysJob.getJobName(), sysJob.getJobGroup(), sysJob.getCronExpression(), new Date());
            sysJobLog.setExecuteTime(String.valueOf(endTime - startTime));
            sysJobLog.setJobLogStatus(QuartzEnum.JOB_LOG_STATUS_FAIL.getType());
            sysJobLog.setJobMessage(QuartzEnum.JOB_LOG_STATUS_FAIL.getDescription());
            sysJobLog.setExceptionInfo(StrUtil.sub(e.getMessage(), 0, 2000));
            //任务表信息更新
            updateJob.setJobExecuteStatus(QuartzEnum.JOB_LOG_STATUS_FAIL.getType());
            updateJob.setStartTime(trigger.getStartTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
            updateJob.setPreviousTime(trigger.getPreviousFireTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
            updateJob.setNextTime(trigger.getNextFireTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
        } finally {
            publisher.publishEvent(new SysJobLogEvent(sysJobLog));
            sysJobService.updateById(updateJob);
        }

    }
}
