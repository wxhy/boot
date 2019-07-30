package com.study.boot.daemon.quartz.event;


import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.utils.TaskInvokeUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Trigger;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * @author carlos
 */
@Slf4j
@AllArgsConstructor
public class SysJobListener {

    private final TaskInvokeUtil taskInvokeUtil;

    /**
     * 异步监听任务执行
     * @param sysJobEvent
     */
    @Async
    @Order
    @EventListener(SysJobEvent.class)
    public void comSysJob(SysJobEvent sysJobEvent) {
        SysJob sysJob = sysJobEvent.getSysJob();
        Trigger trigger = sysJobEvent.getTrigger();
        taskInvokeUtil.invoke(sysJob, trigger);
    }
}
