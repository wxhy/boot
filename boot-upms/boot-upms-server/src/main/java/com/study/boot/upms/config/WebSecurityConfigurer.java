package com.study.boot.upms.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

/**
 * @author Administrator
 */
@Configuration
public class WebSecurityConfigurer extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/actuator/**",
                        "/user/info/*",
                        "/mobile/**",
                        "/ws/**",
                        "/social/info/*",
                        "/log/**").permitAll()
                .anyRequest().authenticated();
    }
}
