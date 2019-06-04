package com.study.boot.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysSocialDetails;


/**
 * @author Administrator
 */
public interface SysSocialDetailsService extends IService<SysSocialDetails> {

    /**
     * 根据入参查询用户信息
     * @param inStr TYPE@CODE
     * @return
     */
    UserInfo getUserInfo(String inStr);
}
