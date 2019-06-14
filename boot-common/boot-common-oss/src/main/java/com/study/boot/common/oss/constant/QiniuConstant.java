package com.study.boot.common.oss.constant;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 */
@Component
@Data
@ConfigurationProperties(prefix = "qiniu")
public class QiniuConstant {

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
