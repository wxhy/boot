package com.study.boot.common.auth.handler;

import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AbstractAuthenticationFailureEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

/**
 *
 * 认证失败事件处理器
 * @author Administrator
 */
public abstract class AbstractAuthenticationFailureEventHandler implements ApplicationListener<AbstractAuthenticationFailureEvent> {



    @Override
    public void onApplicationEvent(AbstractAuthenticationFailureEvent event) {
        AuthenticationException exception = event.getException();
        Authentication authentication = (Authentication) event.getSource();
        handle(exception,authentication);
    }

    public abstract void handle(AuthenticationException authenticationException, Authentication authentication);
}
