package com.study.boot.upms.api.feign;


import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.enums.ServiceNameConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysLog;
import com.study.boot.upms.api.feign.factory.RemoteLogServiceFallFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;


/**
 * @author Administrator
 */
@FeignClient(value = ServiceNameConstants.UMPS_SERVICE,fallbackFactory = RemoteLogServiceFallFactory.class)
@FunctionalInterface
public interface RemoteLogService {


    /**
     * 保存日志
     * @param sysLog
     * @param from
     * @return
     */
    @PostMapping("/log")
    WebResponse saveLog(@RequestBody SysLog sysLog
            , @RequestHeader(SecurityConstants.FROM) String from);
}
