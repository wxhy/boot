package com.study.boot.common.oss.config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 */
@Component
@Data
@RefreshScope
@ConfigurationProperties(prefix = "qiniu")
public class QiniuProperties {

    private String accessKey;

    private String secretKey;

    /**
     * 路径
     */
    private String path;

    /**
     * 存储空间名称
     */
    private String bucket;
}
