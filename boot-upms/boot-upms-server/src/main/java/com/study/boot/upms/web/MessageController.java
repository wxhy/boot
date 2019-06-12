package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysMessage;
import com.study.boot.upms.api.vo.MessageVo;
import com.study.boot.upms.service.SysMessageService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/message")
@AllArgsConstructor
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
    public WebResponse saveMessage(@RequestBody MessageVo messageVo){
        return new WebResponse<>(sysMessageService.saveMessage(messageVo));
    }

    /**
     * 删除消息
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public WebResponse removeMessageById(@PathVariable Integer id) {
        return new WebResponse<>(sysMessageService.removeMessageById(id));
    }


    /**
     * 修改信息
     * @param sysMessage
     * @return
     */
    @PutMapping
    public WebResponse updateMessageById(@RequestBody SysMessage sysMessage) {
        return new WebResponse<>(sysMessageService.updateById(sysMessage));
    }
}
