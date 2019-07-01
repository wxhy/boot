package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysMessage;
import com.study.boot.upms.api.vo.MessageVo;
import com.study.boot.upms.service.SysMessageService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/message")
@AllArgsConstructor
@Api(tags = "消息发送管理")
public class MessageController {

    private final SysMessageService sysMessageService;

    /**
     * 分页获取消息
     * @param page
     * @return
     */
    @GetMapping("/page")
    public WebResponse getMessagePage(Page page){
        return new WebResponse<>(sysMessageService.page(page, Wrappers.emptyWrapper()));
    }

    /**
     *  获取信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getMessage(@PathVariable Integer id) {
        return new WebResponse<>(sysMessageService.getById(id));
    }

    /**
     * 新增消息发送
     * @param messageVo
     * @return
     */
    @PostMapping
    @SysLog("发送消息")
    @PreAuthorize("@pms.hasPermission('sys_message_add')")
    public WebResponse saveMessage(@RequestBody MessageVo messageVo){
        return new WebResponse<>(sysMessageService.saveMessage(messageVo));
    }

    /**
     * 删除消息
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @SysLog("删除消息")
    @PreAuthorize("@pms.hasPermission('sys_message_del')")
    public WebResponse removeMessageById(@PathVariable Integer id) {
        return new WebResponse<>(sysMessageService.removeMessageById(id));
    }


    /**
     * 修改信息
     * @param sysMessage
     * @return
     */
    @PutMapping
    @SysLog("修改消息")
    @PreAuthorize("@pms.hasPermission('sys_message_edit')")
    public WebResponse updateMessageById(@RequestBody SysMessage sysMessage) {
        return new WebResponse<>(sysMessageService.updateById(sysMessage));
    }
}
