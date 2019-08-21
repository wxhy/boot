package com.study.boot.auth.endpoint;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.auth.annoation.Inner;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.constants.PaginationConstants;
import com.study.boot.common.constants.SecurityConstants;
import com.study.boot.common.util.WebResponse;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.ConvertingCursor;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/6/4 19:58
 */
@RestController
@RequestMapping("/token")
@Api(tags="Token管理")
public class CustomTokenEndpoint {

    private static final String BASIC_ = "Bearer";
    @Autowired
    private TokenStore tokenStore;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private RedisTemplate redisTemplate;

    @GetMapping
    public WebResponse getInfo(){
        return new WebResponse();
    }


    @DeleteMapping("/logout")
    public WebResponse logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION,required = false)String authHeader){
        if(StrUtil.isBlank(authHeader)){
            return WebResponse.builder()
                    .code(CommonConstants.FAIL)
                    .data(Boolean.FALSE)
                    .message("退出失败，token为空").build();
        }

        String tokenValue = authHeader.replace(BASIC_,"").trim();

        OAuth2AccessToken accessToken = tokenStore.readAccessToken(tokenValue);
        if (accessToken == null || StrUtil.isBlank(accessToken.getValue())) {
            return WebResponse.builder()
                    .code(CommonConstants.SUCCESS)
                    .data(Boolean.FALSE)
                    .message("退出失败，token 无效").build();
        }

        tokenStore.removeAccessToken(accessToken);
        OAuth2RefreshToken refreshToken = tokenStore.readRefreshToken(tokenValue);
        tokenStore.removeRefreshToken(refreshToken);
        return new WebResponse<>(Boolean.TRUE);
    }


    /**
     * 令牌管理调用
     *
     * @param token token
     * @return
     */
    @Inner
    @DeleteMapping("/{token}")
    public WebResponse<Boolean> delToken(@PathVariable("token") String token) {
        OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(token);
        tokenStore.removeAccessToken(oAuth2AccessToken);
        return new WebResponse<>();
    }

    /**
     * 查询token
     *
     * @param params 分页参数
     * @return
     */
    @PostMapping("/page")
    public WebResponse<Page> tokenList(@RequestBody Map<String, Object> params) {
        //根据分页参数获取对应数据
        String key = SecurityConstants.PROJECT_PREFIX + SecurityConstants.OAUTH_PREFIX + "auth_to_access:";
        Set keys = redisTemplate.keys(key);

        List<String> pages = findKeysForPage(key, MapUtil.getInt(params, PaginationConstants.CURRENT)
                , MapUtil.getInt(params, PaginationConstants.SIZE));

        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
        Page result = new Page(MapUtil.getInt(params, PaginationConstants.CURRENT), MapUtil.getInt(params, PaginationConstants.SIZE));
        result.setRecords(redisTemplate.opsForValue().multiGet(redisTemplate.keys(key+"*")));
        result.setTotal(Long.valueOf(redisTemplate.keys(key).size()));
        return new WebResponse<>(result);
    }


    private List<String> findKeysForPage(String patternKey, int pageNum, int pageSize) {
        ScanOptions options = ScanOptions.scanOptions().match(patternKey).build();
        RedisSerializer<String> redisSerializer = (RedisSerializer<String>) redisTemplate.getKeySerializer();
        Cursor cursor = (Cursor) redisTemplate.executeWithStickyConnection(redisConnection -> new ConvertingCursor<>(redisConnection.scan(options), redisSerializer::deserialize));
        List<String> result = new ArrayList<>();
        int tmpIndex = 0;
        int startIndex = (pageNum - 1) * pageSize;
        int end = pageNum * pageSize;

        assert cursor != null;
        while (cursor.hasNext()) {
            if (tmpIndex >= startIndex && tmpIndex < end) {
                result.add(cursor.next().toString());
                tmpIndex++;
                continue;
            }
            if (tmpIndex >= end) {
                break;
            }
            tmpIndex++;
            cursor.next();
        }
        return result;
    }

}
