package com.study.boot.common.oss;


import com.study.boot.common.oss.config.QiniuProperties;
import com.study.boot.common.oss.service.OssTemplate;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 *
 * @author Administrator
 */
@AllArgsConstructor
@EnableConfigurationProperties(QiniuProperties.class)
public class QiniuAutoConfiguration {

    private final QiniuProperties qiniuProperties;

    @Bean
    @ConditionalOnMissingBean(OssTemplate.class)
    public OssTemplate template(){
        return new OssTemplate(qiniuProperties.getAccessKey(),
                qiniuProperties.getSecretKey(),
                qiniuProperties.getPath(),
                qiniuProperties.getBucket());
    }
}
