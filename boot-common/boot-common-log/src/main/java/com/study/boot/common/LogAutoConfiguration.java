package com.study.boot.common;


import com.study.boot.common.aspect.SysLogAspect;
import com.study.boot.common.event.SysLogListener;
import com.study.boot.upms.api.feign.RemoteLogService;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 日志自动配置
 * @author Administrator
 */
@Configuration
@EnableAsync
@AllArgsConstructor
@ConditionalOnWebApplication
@EnableFeignClients({"com.study.boot.upms.api.feign"})
public class LogAutoConfiguration {

    private final RemoteLogService remoteLogService;

    @Bean
    public SysLogListener sysLogListener(){
        return new SysLogListener(remoteLogService);
    }

    @Bean
    public SysLogAspect sysLogAspect(){
        return new SysLogAspect();
    }
}
