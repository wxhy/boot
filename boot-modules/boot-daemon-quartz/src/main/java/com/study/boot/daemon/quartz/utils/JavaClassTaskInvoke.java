package com.study.boot.daemon.quartz.utils;

import cn.hutool.core.util.StrUtil;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.enums.QuartzEnum;
import com.study.boot.daemon.quartz.exception.TaskException;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 定时任务java class反射实现
 *
 * @author carlos
 */
@Slf4j
@Component("javaClassTaskInvok")
public class JavaClassTaskInvoke implements ITaskInvoke {


    @Override
    @SneakyThrows
    public void invokMethod(SysJob sysJob) {
        Object obj = null;
        Class clazz = null;
        Method method = null;
        Object returnValue = null;
        try {
            if (StrUtil.isNotEmpty(sysJob.getMethodParamsValue())) {
                clazz = Class.forName(sysJob.getClassName());
                obj = clazz.newInstance();
                method = obj.getClass().getDeclaredMethod(sysJob.getMethodName(), String.class);
                returnValue = method.invoke(obj, sysJob.getMethodParamsValue());
            } else {
                clazz = Class.forName(sysJob.getClassName());
                obj = clazz.newInstance();
                method = obj.getClass().getDeclaredMethod(sysJob.getMethodName());
                returnValue = method.invoke(obj);
            }
            if (StrUtil.isEmpty(returnValue.toString()) || QuartzEnum.JOB_LOG_STATUS_FAIL.getType().equals(returnValue.toString())) {
                log.error("定时任务javaClassTaskInvok异常,执行任务：{}", sysJob.getClassName());
                throw new TaskException("定时任务javaClassTaskInvok业务执行失败,任务：" + sysJob.getClassName());
            }
        } catch (ClassNotFoundException e) {
            log.error("定时任务java反射类没有找到,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务java反射类没有找到,执行任务：" + sysJob.getClassName());
        } catch (IllegalAccessException e) {
            log.error("定时任务java反射类异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务java反射类异常,执行任务：" + sysJob.getClassName());
        } catch (InstantiationException e) {
            log.error("定时任务java反射类异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务java反射类异常,执行任务：" + sysJob.getClassName());
        } catch (NoSuchMethodException e) {
            log.error("定时任务java反射执行方法名异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务java反射执行方法名异常,执行任务：" + sysJob.getClassName());
        } catch (
                InvocationTargetException e) {
            log.error("定时任务java反射执行异常,执行任务：{}", sysJob.getClassName());
            throw new TaskException("定时任务java反射执行异常,执行任务：" + sysJob.getClassName());
        }
    }
}
