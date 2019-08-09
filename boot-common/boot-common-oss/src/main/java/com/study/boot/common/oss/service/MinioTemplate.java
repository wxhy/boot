package com.study.boot.common.oss.service;

import io.minio.MinioClient;
import io.minio.ObjectStat;
import io.minio.messages.Bucket;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;

import java.io.InputStream;
import java.util.List;
import java.util.Optional;

/**
 * Minio操作
 *
 * @author Administrator
 */
@RequiredArgsConstructor
public class MinioTemplate implements InitializingBean {

    private final String endpoint;
    private final String accessKey;
    private final String secretKey;
    private MinioClient client;


    /**
     * 创建bucket
     *
     * @param bucketName bucket名称
     */
    @SneakyThrows
    private void createBucket(String bucketName) {
        this.client.makeBucket(bucketName);
    }

    /**
     * 获取全部bucket
     *
     * @return
     */
    @SneakyThrows
    public List<Bucket> getAllBuckets() {
        return client.listBuckets();
    }

    /**
     * 根据名称获取bucket
     *
     * @param bucketName bucket名称
     * @return
     */
    @SneakyThrows
    public Optional<Bucket> getBucket(String bucketName) {
        return client.listBuckets().stream().filter(bucket -> bucket.name().equals(bucketName)).findFirst();
    }

    /**
     * 移除bucket
     *
     * @param bucketName bucket名称
     */
    @SneakyThrows
    public void removeBucket(String bucketName) {
        client.removeBucket(bucketName);
    }

    /**
     * 获取文件外链
     *
     * @param bucketName bucket名称
     * @param objectName 文件名称
     * @param expires    过期时间 <=7
     * @return url
     */
    @SneakyThrows
    public String getObjectURL(String bucketName,String objectName,Integer expires) {
        return client.presignedGetObject(bucketName,objectName,expires);
    }

    /**
     * 获取文件
     * @param bucketName bucket名称
     * @param objectName object名称
     * @return 二进制流
     */
    @SneakyThrows
    public InputStream getObject(String bucketName,String objectName) {
        return client.getObject(bucketName, objectName);
    }

    /**
     *  上传文件
     * @param bucketName bucket名称
     * @param objectName object名称
     * @param stream 文件流
     */
    @SneakyThrows
    public void putObject(String bucketName,String objectName,InputStream stream) {
        client.putObject(bucketName,objectName,stream,stream.available(), "application/octet-stream");
    }

    /**
     * 上传文件
     * @param bucketName bucket名称
     * @param objectName object名称
     * @param stream 文件流
     * @param size  大小
     * @param contentType 类型
     */
    @SneakyThrows
    public void putObject(String bucketName,String objectName,InputStream stream,long size,String contentType) {
        client.putObject(bucketName, objectName, stream, size, contentType);
    }


    /**
     * 获取文件信息
     * @param bucketName bucket名称
     * @param objectName object名称
     * @return
     */
    @SneakyThrows
    public ObjectStat getObjectInfo(String bucketName,String objectName) {
        return client.statObject(bucketName, objectName);
    }

    /**
     * 删除文件
     * @param bucketName bucket名称
     * @param objectName object名称
     */
    @SneakyThrows
    public void removeObject(String bucketName,String objectName) {
        client.removeObject(bucketName, objectName);
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.hasText(endpoint, "Minio Url为空");
        Assert.hasText(accessKey, "Minio AccessKey为空");
        Assert.hasText(secretKey, "Minio secretKey为空");
        this.client = new MinioClient(endpoint, accessKey, secretKey);
    }
}
