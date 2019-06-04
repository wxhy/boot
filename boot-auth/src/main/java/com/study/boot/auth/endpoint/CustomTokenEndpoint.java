package com.study.boot.auth.endpoint;

import cn.hutool.core.util.StrUtil;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.util.WebResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/6/4 19:58
 */
@RestController
@RequestMapping("/token")
public class CustomTokenEndpoint {

    private static final String BASIC_ = "Bearer";
    @Autowired
    private TokenStore tokenStore;

    @GetMapping
    public WebResponse getInfo(){
        return new WebResponse();
    }

    @DeleteMapping("/logout")
    public WebResponse logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION,required = false)String authHeader){
        if(StrUtil.isBlank(authHeader)){
            return WebResponse.builder()
                    .code(CommonConstants.FAIL)
                    .data(Boolean.FALSE)
                    .message("退出失败，token为空").build();
        }

        String tokenValue = authHeader.replace(BASIC_,"").trim();

        OAuth2AccessToken accessToken = tokenStore.readAccessToken(tokenValue);
        if (accessToken == null || StrUtil.isBlank(accessToken.getValue())) {
            return WebResponse.builder()
                    .code(CommonConstants.FAIL)
                    .data(Boolean.FALSE)
                    .message("退出失败，token 无效").build();
        }

        OAuth2Authentication oAuth2Authentication = tokenStore.readAuthentication(accessToken);
        tokenStore.removeAccessToken(accessToken);
        return new WebResponse<>(Boolean.TRUE);


    }
}
