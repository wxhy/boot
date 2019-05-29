package com.study.boot.gateway.filter;

import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.exception.ValidateCodeException;
import com.study.boot.common.util.WebResponse;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

/**
 * 验证码处理
 *
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 20:46
 */
@Component
@Slf4j
@AllArgsConstructor
public class ValidateCodeGatewayFilter extends AbstractGatewayFilterFactory {

    private final RedisTemplate redisTemplate;

    private final ObjectMapper objectMapper;

    @Override
    public GatewayFilter apply(Object config) {
        //校验验证码
        return ((exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();
            //不是登录请求，直接放行，无需校验验证码
            if (!StrUtil.containsAnyIgnoreCase(request.getURI().getPath(), SecurityConstants.OAUTH_TOKEN_URL)) {
                return chain.filter(exchange);
            }

            //是登录请求，但是是刷新token
            String grantType = request.getQueryParams().getFirst("grant_type");
            if (StrUtil.equals(grantType, SecurityConstants.REFRESH_TOKEN)) {
                return chain.filter(exchange);
            }

            try {

                //校验验证码
                checkCode(request);
            } catch (Exception e) {
                ServerHttpResponse response = exchange.getResponse();
                response.setStatusCode(HttpStatus.PRECONDITION_REQUIRED);
                try {
                    return response.writeWith(Mono.just(response.bufferFactory()
                            .wrap(objectMapper.writeValueAsBytes(
                                    WebResponse.builder().message(e.getMessage())
                                            .code(CommonConstants.FAIL).build()))));
                } catch (JsonProcessingException e1) {
                    log.error("对象输出异常", e1);
                }
            }

            return chain.filter(exchange);
        });
    }

    @SneakyThrows
    private void checkCode(ServerHttpRequest request) {
        String code = request.getQueryParams().getFirst("code");
        if (StrUtil.isBlank(code)) {
            throw new Exception("验证码不能为空");
        }
        String randomStr = request.getQueryParams().getFirst("randomStr");
        if (StrUtil.isBlank(randomStr)) {
            randomStr = request.getQueryParams().getFirst("mobile");
        }

        String key = CommonConstants.DEFAULT_CODE_KEY + randomStr;
        if (!redisTemplate.hasKey(key)) {
            throw new ValidateCodeException("验证码不合法");
        }

        Object codeObj = redisTemplate.opsForValue().get(key);

        if (codeObj == null) {
            throw new ValidateCodeException("验证码不合法");
        }

        String saveCode = codeObj.toString();
        if (StrUtil.isBlank(saveCode)) {
            redisTemplate.delete(key);
            throw new ValidateCodeException("验证码不合法");
        }

        if (!StrUtil.equals(saveCode, code)) {
            redisTemplate.delete(key);
            throw new ValidateCodeException("验证码不合法");
        }

        redisTemplate.delete(key);


    }


}
