package com.study.boot.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysSocialDetails;
import com.study.boot.upms.handler.LoginHandler;
import com.study.boot.upms.mapper.SysSocialDetailsMapper;
import com.study.boot.upms.service.SysSocialDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service
@AllArgsConstructor
public class SysSocialDetailsServiceImpl extends ServiceImpl<SysSocialDetailsMapper, SysSocialDetails> implements SysSocialDetailsService {
    private final Map<String, LoginHandler> loginHandlerMap;


    /**
     * 根据入参查询用户信息
     * @param inStr TYPE@CODE
     * @return
     */
    @Override
    public UserInfo getUserInfo(String inStr) {
        String[] inStrs = inStr.split("@");
        String type = inStrs[0];
        String code = inStrs[1];
        return loginHandlerMap.get(type).handle(code);
    }
}
