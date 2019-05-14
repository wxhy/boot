package com.study.boot.upms.api.feign.fallback;


import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 */
@Slf4j
@Component
@Primary
public class RemoteUserServiceFallbackImpl implements RemoteUserService {

    @Setter
    private Throwable cause;

    @Override
    public WebResponse<UserInfo> info(String username, String from) {
        log.error("feign 查询用户信息失败:{}", username, cause);
        return null;
    }
}
