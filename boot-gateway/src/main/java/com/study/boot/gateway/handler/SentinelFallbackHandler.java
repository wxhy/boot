package com.study.boot.gateway.handler;

import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.GatewayCallbackManager;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.google.common.net.HttpHeaders;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.MediaType;
import org.springframework.http.codec.HttpMessageWriter;
import org.springframework.http.codec.ServerCodecConfigurer;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerResponse;
import org.springframework.web.reactive.result.view.ViewResolver;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebExceptionHandler;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;

/**
 * sentinel 服务降级处理
 *
 * @author Carlos
 * @version 1.0
 * @date 2019/5/19 9:46
 */
@Component
@Slf4j
public class SentinelFallbackHandler implements WebExceptionHandler {

    private List<ViewResolver> viewResolvers;
    private List<HttpMessageWriter<?>> messageWriters;

    public SentinelFallbackHandler(List<ViewResolver> viewResolvers, ServerCodecConfigurer serverCodecConfigurer) {
        this.viewResolvers = viewResolvers;
        this.messageWriters = serverCodecConfigurer.getWriters();
    }

    private Mono<Void> writeResponse(ServerResponse response, ServerWebExchange exchange) {
        Optional<Object> originalUris = exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_ORIGINAL_REQUEST_URL_ATTR);
        originalUris.ifPresent(originalUrl->{
            log.error("网关执行请求：{}失败，hystrix服务降级处理",originalUrl);
        });

        ServerHttpResponse serverResponse = exchange.getResponse();
        serverResponse.getHeaders().add(HttpHeaders.CONTENT_TYPE,MediaType.APPLICATION_JSON_UTF8_VALUE);
        byte[] datas = "服务异常".getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = serverResponse.bufferFactory().wrap(datas);
        return serverResponse.writeWith(Mono.just(buffer));
    }

    @Override
    public Mono<Void> handle(ServerWebExchange exchange, Throwable ex) {
        if (exchange.getResponse().isCommitted()) {
            return Mono.error(ex);
        } else {
            return !BlockException.isBlockException(ex) ? Mono.error(ex) : this.handleBlockedRequest(exchange, ex).flatMap((response) -> {
                return this.writeResponse(response, exchange);
            });
        }
    }

    private Mono<ServerResponse> handleBlockedRequest(ServerWebExchange exchange, Throwable throwable) {
        return GatewayCallbackManager.getBlockHandler().handleRequest(exchange, throwable);
    }
}
