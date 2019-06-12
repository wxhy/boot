package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysMessageSend;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysMessageSendService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 *
 *
 */
@RestController
@RequestMapping("messageSend")
@AllArgsConstructor
public class MessageSendController {

    private SysMessageSendService sysMessageSendService;
    private SysUserService sysUserService;
    /**
     *
     * @param page
     * @param messageSend
     * @return
     */
    @GetMapping("/page")
    public WebResponse getMessagePage(Page page, SysMessageSend messageSend) {
        SysUser sysUser = sysUserService.getOne(Wrappers.
                <SysUser>query()
                .lambda()
                .eq(SysUser::getUsername, SecurityUtils.getUserName()));
        messageSend.setUserId(sysUser.getUserId());
        return new WebResponse<>(sysMessageSendService.page(page, Wrappers.query(messageSend)));
    }
}
