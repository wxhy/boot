package com.study.boot.common.auth.handler;


import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * 手机号登录成功，返回oauth_token
 *
 * @author Administrator
 */
@Slf4j
@Builder
public class MobileLoginSuccessHandler implements AuthenticationSuccessHandler {

    private static final String BASIC_ = "Basic ";
    private ObjectMapper objectMapper;
    private PasswordEncoder passwordEncoder;
    private ClientDetailsService clientDetailsService;
    private AuthorizationServerTokenServices defaultAuthorizationServerTokenServices;


    /**
     *
     * Called when a user has been successfully authenticated.
     * 	调用spring security oauth API 生成 oAuth2AccessToken
     * @param request
     * @param response
     * @param authentication
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String header = request.getHeader(HttpHeaders.AUTHORIZATION);


    }
}
