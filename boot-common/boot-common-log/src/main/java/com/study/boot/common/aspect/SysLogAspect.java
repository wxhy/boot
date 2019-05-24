package com.study.boot.common.aspect;

import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.event.SysLogEvent;
import com.study.boot.common.util.SpringContextHolder;
import com.study.boot.common.util.SysLogUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

/**
 * 操作日志使用spring event异步入库
 *
 * @author Q
 */
@Aspect
@Slf4j
public class SysLogAspect {

    @Around("@annotation(sysLog)")
    public Object around(ProceedingJoinPoint point, SysLog sysLog) throws Throwable {
        String className = point.getTarget().getClass().getName();
        String methodName = point.getSignature().getName();
        log.info("类名：{},方法名：{}",className,methodName);

        com.study.boot.upms.api.entity.SysLog log = SysLogUtils.getSysLog();
        log.setTitle(sysLog.value());

        //发送异步日志事件
        Long startTime = System.currentTimeMillis();
        Object proceed = point.proceed();
        Long endTime = System.currentTimeMillis();
        log.setTime(endTime - startTime);
        SpringContextHolder.publishEvent(new SysLogEvent(log));
        return proceed;
    }



}
