package com.study.boot.auth.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.boot.common.auth.handler.MobileLoginSuccessHandler;
import com.study.boot.common.auth.mobile.MobileSecurityConfigurer;
import com.study.boot.common.auth.service.CustomUserDetailsService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * 认证相关配置
 * @author Administrator
 */
@Primary
@Configuration
@Order(90)
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {


    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private ClientDetailsService clientDetailsService;
    @Autowired
    private CustomUserDetailsService userDetailsService;
    @Lazy
    @Autowired
    private AuthorizationServerTokenServices defaultAuthorizationServerTokenServices;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin()
                .and()
                .authorizeRequests()
                .antMatchers(
                        "/actuator/**",
                        "/mobile/**",
                        "/token/**").permitAll()
                .anyRequest().authenticated()
                .and().csrf().disable()
                .headers().frameOptions().sameOrigin()
                .and()
                .apply(mobileSecurityConfigurer());
    }


    @Bean
    public AuthenticationSuccessHandler mobileLoginSuccessHandler(){
        return MobileLoginSuccessHandler.builder()
                .clientDetailsService(clientDetailsService)
                .objectMapper(objectMapper)
                .passwordEncoder(passwordEncoder())
                .defaultAuthorizationServerTokenServices(defaultAuthorizationServerTokenServices)
                .build();
    }


    @Bean
    public MobileSecurityConfigurer mobileSecurityConfigurer(){
        MobileSecurityConfigurer mobileSecurityConfigurer = new MobileSecurityConfigurer();
        mobileSecurityConfigurer.setMobileLoginSuccessHandler(mobileLoginSuccessHandler());
        mobileSecurityConfigurer.setUserDetailsService(userDetailsService);
        return mobileSecurityConfigurer;
    }

    @Bean
    @Override
    @SneakyThrows
    public AuthenticationManager authenticationManagerBean(){
        return super.authenticationManagerBean();
    }


    /**
     * https://spring.io/blog/2017/11/01/spring-security-5-0-0-rc1-released#password-storage-updated
     * Encoded password does not look like BCrypt
     *
     * @return PasswordEncoder
     */
    @Bean
    public PasswordEncoder passwordEncoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}
