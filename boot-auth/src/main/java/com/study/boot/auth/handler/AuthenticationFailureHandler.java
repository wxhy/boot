package com.study.boot.auth.handler;

import com.study.boot.common.auth.handler.AbstractAuthenticationFailureEventHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/6/4 20:33
 */

@Slf4j
@Component
public class AuthenticationFailureHandler extends AbstractAuthenticationFailureEventHandler {
    @Override
    public void handle(AuthenticationException authenticationException, Authentication authentication) {
        log.info("用户：{} 登录失败，异常：{}", authentication.getPrincipal(), authenticationException.getLocalizedMessage());
    }
}
