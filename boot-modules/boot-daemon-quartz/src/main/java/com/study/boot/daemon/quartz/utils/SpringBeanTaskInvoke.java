package com.study.boot.daemon.quartz.utils;

import cn.hutool.core.util.StrUtil;
import com.study.boot.common.util.SpringContextHolder;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.enums.QuartzEnum;
import com.study.boot.daemon.quartz.exception.TaskException;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author carlos
 */

@Component("springBeanTaskInvoke")
@Slf4j
public class SpringBeanTaskInvoke implements ITaskInvoke {

    @Override
    @SneakyThrows
    public void invokMethod(SysJob sysJob) {

        Method method = null;
        Object returnValue = null;
        Object target = null;

        target = SpringContextHolder.getBean(sysJob.getClassName());
        try {
            //有参方法无参方法
            if (StrUtil.isNotEmpty(sysJob.getMethodParamsValue())) {
                method = target.getClass().getDeclaredMethod(sysJob.getClassName(), String.class);
                ReflectionUtils.makeAccessible(method);
                returnValue = method.invoke(target, sysJob.getMethodParamsValue());
            } else {
                method = target.getClass().getDeclaredMethod(sysJob.getClassName());
                ReflectionUtils.makeAccessible(method);
                returnValue = method.invoke(target);
            }

            if (StrUtil.isEmpty(returnValue.toString()) || QuartzEnum.JOB_LOG_STATUS_FAIL.getType()
                    .equals(returnValue.toString())) {
                log.error("定时任务springBeanTaskInvok异常,执行任务：{}", sysJob.getClassName());
                throw new TaskException("定时任务springBeanTaskInvok业务执行失败,任务：" + sysJob.getClassName());
            }
        } catch (NoSuchMethodException e) {
            log.error("定时任务spring bean反射异常方法未找到,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务spring bean反射异常方法未找到,执行任务：" + sysJob.getClassName());
        } catch (IllegalAccessException e) {
            log.error("定时任务spring bean反射异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务spring bean反射异常,执行任务：" + sysJob.getClassName());
        } catch (InvocationTargetException e) {
            log.error("定时任务spring bean反射执行异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务spring bean反射执行异常,执行任务：" + sysJob.getClassName());
        }
    }
}
