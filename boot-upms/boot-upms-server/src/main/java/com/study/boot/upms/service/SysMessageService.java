package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.entity.SysMessage;
import com.study.boot.upms.api.vo.MessageVo;

/**
 * @author Administrator
 */
public interface SysMessageService extends IService<SysMessage> {

    /**
     * 保存消息
     * @param messageVo
     * @return
     */
    Boolean saveMessage(MessageVo messageVo);

    /**
     * 删除消息
     * @param id
     * @return
     */
    Boolean removeMessageById(Integer id);
}
