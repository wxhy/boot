package com.study.boot.common.oss.service;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.URLUtil;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.study.boot.common.oss.vo.QiniuResult;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.net.URL;

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


    @SneakyThrows
    public QiniuResult createObject(MultipartFile object,String objectName) {
        Configuration cfg = new Configuration(Zone.zone2());
        UploadManager uploadManager = new UploadManager(cfg);

        Auth auth = Auth.create(accessKey, secretKey);
        String uploadToken = auth.uploadToken(bucket);
        StringMap putPolicy = new StringMap();
        InputStream stream = this.getClass().getClassLoader().getResourceAsStream("QiniuResult.json");
        putPolicy.put("returnBody",IoUtil.read(stream, CharsetUtil.UTF_8)) ;
        Response response = uploadManager.put(object.getInputStream(), objectName, uploadToken, putPolicy, null);
        //解析上传成功的结果
        QiniuResult result = response.jsonToObject(QiniuResult.class);
        return result;
    }


    @SneakyThrows
    public InputStream getObject(String key){
        URL url = new URL(path + key);
        return  URLUtil.getStream(url);
    }

}
