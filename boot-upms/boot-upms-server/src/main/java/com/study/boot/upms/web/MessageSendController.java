package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysMessageSend;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysMessageSendService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

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
        SysUser sysUser = sysUserService.findByUsername(SecurityUtils.getUserName());
        messageSend.setUserId(sysUser.getUserId());
        return new WebResponse<>(sysMessageSendService.page(page, Wrappers.query(messageSend).orderByDesc("create_time")));
    }

    /**
     * 获取消息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getMessageById(@PathVariable Integer id) {
        return new WebResponse<>(sysMessageSendService.getById(id));
    }

    /**
     * 标记为已读
     * @param id
     * @return
     */
    @PutMapping("/read/{id}")
    public WebResponse readMessage(@PathVariable Integer id) {
        SysMessageSend send = sysMessageSendService.getById(id);
        //已读
        send.setStatus(CommonConstants.STATUS_DEL);
        return new WebResponse<>(sysMessageSendService.updateById(send));
    }

    /**
     * 标记所有未读消息为已读
     * @return
     */
    @GetMapping("/read-all")
    public WebResponse readAllMessage() {
        SysUser sysUser = sysUserService.findByUsername(SecurityUtils.getUserName());

        List<SysMessageSend> messageSends = sysMessageSendService.list(Wrappers.<SysMessageSend>query()
                .lambda()
                .eq(SysMessageSend::getUserId, sysUser.getUserId())
                .eq(SysMessageSend::getStatus, CommonConstants.STATUS_NORMAL))
                .stream()
                .map(send -> {
                    send.setStatus(CommonConstants.STATUS_DEL);
                    return send;
                }).collect(Collectors.toList());
        return new WebResponse<>(sysMessageSendService.updateBatchById(messageSends));
    }

    /**
     * 移除消息到回收站
     * @param id
     * @return
     */
    @PutMapping("/{id}")
    public WebResponse updateMessage(@PathVariable Integer id) {
        SysMessageSend messageSend = this.sysMessageSendService.getById(id);
        messageSend.setDelflag(CommonConstants.STATUS_DEL);
        return new WebResponse<>(this.sysMessageSendService.updateById(messageSend));
    }

    /**
     * 彻底删除消息
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public WebResponse removeMessageSend(@PathVariable Integer id){
        return new WebResponse<>(this.sysMessageSendService.removeById(id));
    }
}
