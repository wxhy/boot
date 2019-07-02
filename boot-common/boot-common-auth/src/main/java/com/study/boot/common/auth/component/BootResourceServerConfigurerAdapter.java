package com.study.boot.common.auth.component;

import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

/**
 * @author Administrator
 */
@Slf4j
public class BootResourceServerConfigurerAdapter extends ResourceServerConfigurerAdapter {

    @Autowired
    private PermitAllUrlProperties permitAllUrlProperties;


    @Override
    @SneakyThrows
    public void configure(HttpSecurity http) {
        //允许使用iframe 嵌套，避免swagger-ui 不被加载的问题
        http.headers().frameOptions().disable();
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>
            .ExpressionInterceptUrlRegistry registry = http
            .authorizeRequests();
        permitAllUrlProperties.getIgnoreUrls().forEach(url-> registry.antMatchers(url).permitAll());
        registry.anyRequest().authenticated()
                .and().csrf().disable();
    }
}
