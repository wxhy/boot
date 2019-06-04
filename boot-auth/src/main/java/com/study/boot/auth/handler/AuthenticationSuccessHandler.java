package com.study.boot.auth.handler;

import com.study.boot.common.auth.handler.AbstractAuthenticationSuccessEventHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/6/4 20:34
 */
@Slf4j
@Component
public class AuthenticationSuccessHandler extends AbstractAuthenticationSuccessEventHandler {
    @Override
    public void handle(Authentication authentication) {
        log.info("用户：{} 登录成功", authentication.getPrincipal());
    }
}
