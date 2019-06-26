package com.study.boot.pay.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

/**
 * @author Administrator
 */
@Configuration
public class WebSercurityConfigure extends ResourceServerConfigurerAdapter {


    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers(
                        "/actuator/**",
                        "/pay/notify").permitAll()
                .anyRequest().authenticated()
                .and()
                .headers().frameOptions().disable();
    }
}