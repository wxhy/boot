package com.study.boot.upms.api.feign;

import com.study.boot.common.enums.SecurityConstants;
import com.study.boot.common.enums.ServiceNameConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.feign.factory.RemoteUserServiceFallFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * 远程调用userService
 *
 * @author Administrator
 */
@FeignClient(value = ServiceNameConstants.UMPS_SERVICE,fallbackFactory = RemoteUserServiceFallFactory.class)
public interface RemoteUserService {


    /**
     * 通过用户名查询用户、角色信息
     *
     * @param username 用户名
     * @param from     调用标志
     * @return R
     */
    @GetMapping("/user/info/{username}")
    WebResponse<UserInfo> info(@PathVariable("username") String username
            , @RequestHeader(SecurityConstants.FROM) String from);
}
