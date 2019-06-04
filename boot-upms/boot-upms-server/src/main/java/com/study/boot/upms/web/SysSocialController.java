package com.study.boot.upms.web;


import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.service.SysSocialDetailsService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RequestMapping("/social")
@RestController
@AllArgsConstructor
@Slf4j
public class SysSocialController {

    private final SysSocialDetailsService sysSocialDetailsService;

    /**
     * 通过社交账号、手机号查询用户、角色信息
     * @param inStr type@code
     * @return
     */
    @GetMapping("/info/{inStr}")
    public WebResponse<UserInfo>  getUserInfo(@PathVariable String inStr) {
        return new WebResponse<>(sysSocialDetailsService.getUserInfo(inStr));
    }



}
