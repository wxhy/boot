package com.study.boot.upms.api.feign.factory;

import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.feign.RemoteUserService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 *
 * @author Administrator
 */
@Component
@Slf4j
public class RemoteUserServiceFallFactory implements FallbackFactory<RemoteUserService> {


    @Override
    public RemoteUserService create(Throwable throwable) {
        return new RemoteUserService() {
            @Override
            public WebResponse<UserInfo> info(String username, String from) {
                log.error("feign 查询用户信息失败:{}", username, throwable);
                return null;
            }

            @Override
            public WebResponse<UserInfo> social(String code, String from) {
                log.error("feign 查询用户信息失败:{}", code, throwable);
                return null;
            }

            @Override
            public WebResponse<List<SysUser>> ancestorUsers(String username) {
                log.error("feign 查询用户上级部门失败:{}", username, throwable);
                return null;
            }
        };

    }
}
