package com.study.boot.pay.config;


import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.ulisesbocchio.jasyptspringboot.annotation.ConditionalOnMissingBean;
import lombok.AllArgsConstructor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Administrator
 */
@AllArgsConstructor
@Configuration
@EnableConfigurationProperties(AlipayConfig.class)
public class AlipayAutoConfiguration {

    private final AlipayConfig alipayConfig;


    @Bean(name = "alipayClient")
    @ConditionalOnMissingBean
    public AlipayClient alipayClient(){
        return new DefaultAlipayClient(alipayConfig.getGatewayUrl(),alipayConfig.getAppId(),
                alipayConfig.getMerchantPrivateKey(),alipayConfig.getParamType(),
                alipayConfig.getCharset(),alipayConfig.getAlipayPublicKey(),
                alipayConfig.getSignType());
    }
}
