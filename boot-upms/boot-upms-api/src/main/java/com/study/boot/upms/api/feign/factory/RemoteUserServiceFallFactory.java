package com.study.boot.upms.api.feign.factory;

import com.study.boot.upms.api.feign.RemoteUserService;
import com.study.boot.upms.api.feign.fallback.RemoteUserServiceFallbackImpl;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 *
 * @author Administrator
 */
@Component
public class RemoteUserServiceFallFactory implements FallbackFactory<RemoteUserService> {


    @Override
    public RemoteUserService create(Throwable throwable) {
        RemoteUserServiceFallbackImpl remoteUserServiceFallback=new RemoteUserServiceFallbackImpl();
        remoteUserServiceFallback.setCause(throwable);
        return remoteUserServiceFallback;
    }
}
