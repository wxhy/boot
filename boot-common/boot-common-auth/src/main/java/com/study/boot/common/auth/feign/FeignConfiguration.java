package com.study.boot.common.auth.feign;

import cn.hutool.core.collection.CollectionUtil;
import com.study.boot.common.constants.SecurityConstants;
import feign.Feign;
import feign.RequestInterceptor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collection;

/**
 * 增强Feign配置
 * @author Administrator
 */
@Configuration
@ConditionalOnClass(Feign.class)
public class FeignConfiguration {


    @Bean
    @ConditionalOnProperty("security.oauth2.client.client-id")
    public RequestInterceptor oauth2FeignRequestInterceptor(){
        return requestTemplate -> {
            Collection<String> fromHeader = requestTemplate.headers().get(SecurityConstants.FROM);
            // 内部调用 无须校验token
            if(CollectionUtil.isNotEmpty(fromHeader) && fromHeader.contains(SecurityConstants.FROM_IN)) {
                return;
            }
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if(authentication != null) {
                if(authentication instanceof OAuth2Authentication) {
                    OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) authentication.getDetails();
                    String access_token = details.getTokenValue();
                    requestTemplate.header("Authorization", OAuth2AccessToken.BEARER_TYPE + " " +access_token);
                }
            }
        };
    }
}
