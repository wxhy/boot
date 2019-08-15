package com.study.boot.upms.api.feign;

import com.study.boot.common.constants.SecurityConstants;
import com.study.boot.common.constants.ServiceNameConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysRouteConf;
import com.study.boot.upms.api.entity.SysUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.List;

/**
 * 远程调用userService
 *
 * @author Administrator
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.UMPS_SERVICE)
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


    /**
     * 通过社交账号或手机号查询用户、角色信息
     *
     * @param inStr type@code
     * @param from
     * @return
     */
    @GetMapping("/social/info/{inStr}")
    WebResponse<UserInfo> social(@PathVariable("inStr") String inStr
            , @RequestHeader(SecurityConstants.FROM) String from);

    /**
     * 查询上级部门的用户信息
     *
     * @param username 用户名
     * @return R
     */
    @GetMapping("/user/ancestor/{username}")
    WebResponse<List<SysUser>> ancestorUsers(@PathVariable("username") String username);

    /**
     * 获取路由
     *
     * @return
     */
    @GetMapping("/route")
    WebResponse<List<SysRouteConf>> routes();


}