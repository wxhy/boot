package com.study.boot.common.auth.feign;

import cn.hutool.core.collection.CollectionUtil;
import com.study.boot.common.constants.SecurityConstants;
import feign.RequestTemplate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.security.oauth2.client.feign.OAuth2FeignRequestInterceptor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collection;

/**
 * 扩展OAuth2FeignRequestInterceptor
 * @author Administrator
 */
@Slf4j
public class FeignClientInterceptor extends OAuth2FeignRequestInterceptor {
    private final OAuth2ClientContext oAuth2ClientContext;

    /**
     * Default constructor which uses the provided OAuth2ClientContext and Bearer tokens
     * within Authorization header
     *
     * @param oAuth2ClientContext     provided context
     * @param resource                type of resource to be accessed
     * @param
     */
    public FeignClientInterceptor(OAuth2ClientContext oAuth2ClientContext,
                                  OAuth2ProtectedResourceDetails resource) {
        super(oAuth2ClientContext, resource);
        this.oAuth2ClientContext = oAuth2ClientContext;
    }

    /**
     * Create a template with the header of provided name and extracted extract
     * 1. 如果使用 非web 请求，header 区别
     * 2. 根据authentication 还原请求token
     *
     * @param template
     */
    @Override
    public void apply(RequestTemplate template) {
        Collection<String> fromHeader = template.headers().get(SecurityConstants.FROM);
        // 内部调用 无须校验token
        if(CollectionUtil.isNotEmpty(fromHeader) && fromHeader.contains(SecurityConstants.FROM_IN)) {
            return;
        }
        copyToken();
        if (oAuth2ClientContext != null
                && oAuth2ClientContext.getAccessToken() != null) {
            super.apply(template);
        }
    }

    private void copyToken(){
        if(oAuth2ClientContext == null) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null) {
                Object details = authentication.getDetails();
                if (details instanceof OAuth2AuthenticationDetails) {
                    OAuth2AuthenticationDetails holder = (OAuth2AuthenticationDetails) details;
                    String token = holder.getTokenValue();
                    DefaultOAuth2AccessToken accessToken = new DefaultOAuth2AccessToken(
                            token);
                    String tokenType = holder.getTokenType();
                    if (tokenType != null) {
                        accessToken.setTokenType(tokenType);
                    }
                    oAuth2ClientContext.setAccessToken(accessToken);
                }
            }
        }
    }
}
