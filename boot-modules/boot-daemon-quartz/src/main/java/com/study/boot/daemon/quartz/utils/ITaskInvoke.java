package com.study.boot.daemon.quartz.utils;

import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.exception.TaskException;


/**
 * 定时任务反射实现接口类
 * @author carlos
 */
public interface ITaskInvoke {

    /**
     * 执行反射方法
     * @param sysJob  配置类
     * @throws TaskException
     */
    void invokMethod(SysJob sysJob) throws TaskException;
}
