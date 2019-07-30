package com.study.boot.daemon.quartz.utils;

import cn.hutool.core.util.StrUtil;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.exception.TaskException;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * 定时任务可执行jar反射实现
 *
 * @author carlos
 */
@Slf4j
@Component("jarTaskInvoke")
public class JarTaskInvoke implements ITaskInvoke {


    @Override
    @SneakyThrows
    public void invokMethod(SysJob sysJob) {
        ProcessBuilder processBuilder = new ProcessBuilder();
        File jar = new File(sysJob.getExecutePath());

        processBuilder.directory(jar.getParentFile());

        List<String> commands = new ArrayList<>();
        commands.add("java");
        commands.add("-jar");

        commands.add(sysJob.getExecutePath());

        if (StrUtil.isNotEmpty(sysJob.getMethodParamsValue())) {
            commands.add(sysJob.getMethodParamsValue());
        }

        processBuilder.command(commands);
        try {
            processBuilder.start();
        } catch (IOException e) {
            log.error("定时任务jar反射执行异常,执行任务：{}", sysJob.getExecutePath());
            throw new TaskException("定时任务jar反射执行异常,执行任务：" + sysJob.getExecutePath());
        }

    }
}
