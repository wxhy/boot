package com.study.boot.upms.api.feign.factory;

import com.study.boot.upms.api.feign.RemoteLogService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Administrator
 */
@Slf4j
public class RemoteLogServiceFallFactory implements FallbackFactory<RemoteLogService> {


    @Override
    public RemoteLogService create(Throwable throwable) {
        return ((sysLog, from) -> {
            log.error("feign 插入日志失败", throwable);
            return null;
        });
    }
}
