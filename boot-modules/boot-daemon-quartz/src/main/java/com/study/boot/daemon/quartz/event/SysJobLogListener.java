package com.study.boot.daemon.quartz.event;


import com.study.boot.daemon.quartz.entity.SysJobLog;
import com.study.boot.daemon.quartz.service.SysJobLogService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 *
 * @author
 */
@Slf4j
@AllArgsConstructor
public class SysJobLogListener {

    private SysJobLogService sysJobLogService;

    @Async
    @Order
    @EventListener(SysJobLogEvent.class)
    public void saveJobLog(SysJobLogEvent sysJobLogEvent) {
        SysJobLog sysJobLog = sysJobLogEvent.getSysJobLog();
        sysJobLogService.save(sysJobLog);
        log.info("执行定时任务日志");
    }
}
