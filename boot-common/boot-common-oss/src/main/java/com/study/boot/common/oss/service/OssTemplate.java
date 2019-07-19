package com.study.boot.common.oss.service;

import cn.hutool.core.util.URLUtil;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.BatchStatus;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.study.boot.common.oss.vo.QiniuResult;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 */
@Component
@AllArgsConstructor
public class OssTemplate {

    private final String accessKey;
    private final String secretKey;
    private final String path;
    private final String bucket;

    /**
     * 上传文件
     * @param object
     * @param objectName
     * @return
     */
    @SneakyThrows
    public QiniuResult createObject(MultipartFile object,String objectName) {
        Configuration cfg = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(cfg);

        Auth auth = Auth.create(accessKey, secretKey);
        StringMap putPolicy = new StringMap();
        InputStream stream = this.getClass().getClassLoader().getResourceAsStream("QiniuResult.json");
        putPolicy.put("returnBody","{\"fkey\": \"$(key)\",\"fileSize\": $(fsize), \"type\": \"$(mimeType)\"}") ;
        long expireSeconds = 3600;
        String uploadToken = auth.uploadToken(bucket,null,expireSeconds,putPolicy);

        Response response = uploadManager.put(object.getInputStream(), objectName, uploadToken,null,null);
        //解析上传成功的结果
        QiniuResult result = response.jsonToObject(QiniuResult.class);
        return result;
    }


    @SneakyThrows
    public InputStream getObject(String key){
        URL url = new URL(path + key);
        return  URLUtil.getStream(url);
    }

    /**
     * 批量删除文件
     * @param keyList
     * @return
     */
    public List<String> removeBatch(String[] keyList){
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        List<String> result = new ArrayList<>();
        try {
            BucketManager.BatchOperations batchOperations = new BucketManager.BatchOperations();
            batchOperations.addDeleteOp(bucket,keyList);
            Response response  = bucketManager.batch(batchOperations);
            BatchStatus[] batchStatusList = response.jsonToObject(BatchStatus[].class);
            for (int i = 0; i < keyList.length; i++) {
                BatchStatus status = batchStatusList[i];
                String key = keyList[i];
                if (status.code == 200) {
                    result.add(key);
                }
            }
        }catch (QiniuException e) {
            return result;
        }
        return result;
    }

    /**
     * 删除文件
     * @param key
     * @return
     */
    public Boolean removeObject(String key) {
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(bucket,key);
        }catch (QiniuException e) {
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }

    /**
     * 复制文件
     * @param fromKey 原文件名
     * @param toKey 现有文件名
     * @return
     */
    public Boolean copyObject(String fromKey,String toKey) {
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.copy(bucket,fromKey,bucket,toKey);
        }catch (QiniuException e) {
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }

}
