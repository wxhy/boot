package com.study.boot.upms.handler;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.upms.api.dto.UserInfo;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 */
@Component("SMS")
@AllArgsConstructor
@Slf4j
public class SmsLoginHandler extends AbstractLoginHandler {

    private final SysUserService sysUserService;

    /**
     * 验证码登录传入为手机号
     * @param mobile
     * @return
     */
    @Override
    public String identify(String mobile) {
        return mobile;
    }

    @Override
    public UserInfo info(String mobile) {
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query()
                .lambda()
                .eq(SysUser::getPhone, mobile));
        if (user == null) {
            log.info("手机号未注册:{}", mobile);
            return null;
        }
        return sysUserService.getUserInfo(user);
    }
}
