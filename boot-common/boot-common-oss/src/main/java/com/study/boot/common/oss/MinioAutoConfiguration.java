package com.study.boot.common.oss;

import com.study.boot.common.oss.config.MinioProperties;
import com.study.boot.common.oss.service.MinioTemplate;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * Minio自动配置
 * @author Administrator
 */
@AllArgsConstructor
@EnableConfigurationProperties(MinioProperties.class)
public class MinioAutoConfiguration {

    private final MinioProperties minioProperties;

    @Bean
    @ConditionalOnMissingBean(MinioTemplate.class)
    public MinioTemplate minioTemplate(){
        return new MinioTemplate(minioProperties.getUrl(),minioProperties.getAccessKey(),minioProperties.getSecretKey());
    }
}
