package com.study.boot.daemon.quartz.utils;

import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.exception.TaskException;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * @author carlos
 */
@Component("restTaskInvoke")
@AllArgsConstructor
@Slf4j
public class RestTaskInvoke implements ITaskInvoke {

    private RestTemplate restTemplate;

    @Override
    @SneakyThrows
    public void invokMethod(SysJob sysJob) {
        WebResponse result = restTemplate.getForObject(sysJob.getExecutePath(), WebResponse.class);
        if (CommonConstants.FAIL.equals(result.getCode())) {
            log.error("定时任务restTaskInvok异常,执行任务：{}", sysJob.getExecutePath());
            throw new TaskException("定时任务restTaskInvok业务执行失败,任务：" + sysJob.getExecutePath());
        }

    }
}
