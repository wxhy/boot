package com.study.boot.daemon.quartz.config;


import com.study.boot.daemon.quartz.enums.QuartzEnum;
import com.study.boot.daemon.quartz.service.SysJobService;
import com.study.boot.daemon.quartz.utils.TaskUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Scheduler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 初始化加载定时任务
 *
 * @author
 */
@Configuration
@AllArgsConstructor
@Slf4j
public class InitQuartzJob {

    private final TaskUtil taskUtil;
    private final Scheduler scheduler;
    private final SysJobService sysJobService;

    @Bean
    public void customize() {
        sysJobService.list().forEach(sysJob -> {

            if (QuartzEnum.JOB_STATUS_RELEASE.getType().equals(sysJob.getJobStatus())) {
                taskUtil.removeJob(sysJob, scheduler);
            } else if (QuartzEnum.JOB_STATUS_RUNNING.getType().equals(sysJob.getJobStatus())) {
                taskUtil.resumeJob(sysJob, scheduler);
            } else if (QuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(sysJob.getJobStatus())) {
                taskUtil.pauseJob(sysJob, scheduler);
            } else {
                taskUtil.removeJob(sysJob, scheduler);
            }
        });
    }
}
