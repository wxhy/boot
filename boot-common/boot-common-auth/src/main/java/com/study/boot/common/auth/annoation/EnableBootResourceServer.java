package com.study.boot.common.auth.annoation;

import com.study.boot.common.auth.component.BootResourceServerAutoConfiguration;
import com.study.boot.common.auth.component.SecurityBeanDefinitionRegistrar;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

import java.lang.annotation.*;

/**
 * 资源服务注解
 * @author Administrator
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Import({BootResourceServerAutoConfiguration.class, SecurityBeanDefinitionRegistrar.class})
public @interface EnableBootResourceServer {
}
