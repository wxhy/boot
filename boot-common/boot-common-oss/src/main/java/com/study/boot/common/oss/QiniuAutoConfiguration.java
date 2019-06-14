package com.study.boot.common.oss;


import com.study.boot.common.oss.constant.QiniuConstant;
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
@EnableConfigurationProperties(QiniuConstant.class)
public class QiniuAutoConfiguration {

    private final QiniuConstant qiniuConstant;

    @Bean
    @ConditionalOnMissingBean(OssTemplate.class)
    public OssTemplate template(){
        return new OssTemplate(qiniuConstant.getAccessKey(),
                qiniuConstant.getSecretKey(),
                qiniuConstant.getPath(),
                qiniuConstant.getBucket());
    }
}
