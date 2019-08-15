package com.study.boot.upms.api.feign;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.constants.SecurityConstants;
import com.study.boot.common.constants.ServiceNameConstants;
import com.study.boot.common.util.WebResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author Administrator
 */
@FeignClient(contextId = "remoteTokenService", value = ServiceNameConstants.AUTH_SERVICE)
public interface RemoteTokenService {

    /**
     * 分页查询token 信息
     *
     * @param from   内部调用标志
     * @param params 分页参数
     * @param from   内部调用标志
     * @return page
     */
    @PostMapping("/token/page")
    WebResponse<Page> getTokenPage(@RequestBody Map<String, Object> params, @RequestHeader(SecurityConstants.FROM) String from);

    /**
     * 删除token
     *
     * @param from  内部调用标志
     * @param token token
     * @param from  内部调用标志
     * @return
     */
    @DeleteMapping("/token/{token}")
    WebResponse<Boolean> removeTokenById(@PathVariable("token") String token, @RequestHeader(SecurityConstants.FROM) String from);
}
