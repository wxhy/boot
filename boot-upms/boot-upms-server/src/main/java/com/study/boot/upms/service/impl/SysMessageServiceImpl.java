package com.study.boot.upms.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.enums.CommonConstants;
import com.study.boot.upms.api.entity.SysMessage;
import com.study.boot.upms.api.entity.SysMessageSend;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.vo.MessageVo;
import com.study.boot.upms.mapper.SysMessageMapper;
import com.study.boot.upms.service.SysMessageSendService;
import com.study.boot.upms.service.SysMessageService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysMessageServiceImpl extends ServiceImpl<SysMessageMapper, SysMessage> implements SysMessageService {

    private SysMessageSendService sysMessageSendService;
    private SysUserService sysUserService;

    /**
     * 保存发送消息
     * @param messageVo
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveMessage(MessageVo messageVo) {
        SysMessage sysMessage = new SysMessage();
        BeanUtil.copyProperties(messageVo,sysMessage);
        this.baseMapper.insert(sysMessage);

        List<Integer> userIds = messageVo.getUserIds();
        //发送全体会员
        if(CommonConstants.STATUS_NORMAL.equals(messageVo.getRanger())) {
            List<SysUser> users = sysUserService.list(Wrappers.emptyWrapper());
            userIds = users.stream().map(SysUser::getUserId).collect(Collectors.toList());
        }
        List<SysMessageSend> sends = userIds.stream()
                .map(userId -> {
                    SysMessageSend messageSend = new SysMessageSend();
                    messageSend.setContent(messageVo.getContent());
                    messageSend.setCreateBy(SecurityUtils.getUserName());
                    messageSend.setMessageId(sysMessage.getMessageId());
                    messageSend.setTitle(sysMessage.getTitle());
                    messageSend.setType(sysMessage.getType());
                    messageSend.setUserId(userId);
                    messageSend.setUserName(SecurityUtils.getUserName());
                    return messageSend;
                }).collect(Collectors.toList());
        this.sysMessageSendService.saveBatch(sends);
        return Boolean.TRUE;
    }

    /**
     * 删除消息
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeMessageById(Integer id) {
        this.sysMessageSendService.remove(Wrappers.<SysMessageSend>query().lambda().eq(SysMessageSend::getMessageId,id));
        this.removeById(id);
        return Boolean.TRUE;
    }
}
