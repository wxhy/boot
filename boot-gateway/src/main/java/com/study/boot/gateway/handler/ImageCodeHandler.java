package com.study.boot.gateway.handler;

import cn.hutool.core.io.FastByteArrayOutputStream;
import com.google.code.kaptcha.Producer;
import com.study.boot.common.constants.CommonConstants;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * 生成验证码
 *
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 20:47
 */

@Slf4j
@AllArgsConstructor
@Component
public class ImageCodeHandler implements HandlerFunction<ServerResponse> {

    private final Producer producer;
    private final RedisTemplate redisTemplate;


    @Override
    public Mono<ServerResponse> handle(ServerRequest request) {
        //生成验证码
        String text = producer.createText();
        BufferedImage image = producer.createImage(text);


        //保存验证码信息
        String randomStr = request.queryParam("randomStr").get();
        //存储到redis,过期时间
        redisTemplate.opsForValue().set(CommonConstants.DEFAULT_CODE_KEY + randomStr, text,
                CommonConstants.CODE_TIME, TimeUnit.SECONDS);

        //转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image,"jpeg",os);
        } catch (IOException e) {
            log.error("生成验证码异常",e);
            return Mono.error(e);
        }
        return ServerResponse.status(HttpStatus.OK)
                .contentType(MediaType.IMAGE_JPEG)
                .body(BodyInserters.fromResource(new ByteArrayResource(os.toByteArray())));
    }
}
