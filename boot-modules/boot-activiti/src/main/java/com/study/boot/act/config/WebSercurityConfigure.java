package com.study.boot.act.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 19:49
 */
@Configuration
public class WebSercurityConfigure extends ResourceServerConfigurerAdapter {


    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers(
                        "/actuator/**",
                        "/service/**",
                        "/editor-app/**",
                        "/ws/**",
                        "/modeler.html").permitAll()
                .anyRequest().authenticated();
    }
}
