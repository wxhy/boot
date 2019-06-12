package com.study.boot.upms.service.impl;

import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.enums.LoginTypeEnum;
import com.study.boot.common.constants.SecurityConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.service.MobileService;
import com.study.boot.upms.service.SysUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class MobileServiceImpl implements MobileService {
    private final RedisTemplate redisTemplate;
    private final SysUserService sysUserService;

    @Override
    public WebResponse sendSmsCode(String mobile) {
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query()
                .lambda().eq(SysUser::getPhone,mobile));

        if(user == null) {
            return new WebResponse<>(Boolean.FALSE,"手机号未注册");
        }

        Object codeObj = redisTemplate.opsForValue().get(CommonConstants.DEFAULT_CODE_KEY + mobile);
        if (codeObj != null) {
            log.info("手机号验证码未过期:{}，{}", mobile, codeObj);
            return new WebResponse<>(Boolean.FALSE, "手机号未注册");
        }

        String code = RandomUtil.randomNumbers(Integer.parseInt(SecurityConstants.CODE_SIZE));
        redisTemplate.opsForValue().set(
                        CommonConstants.DEFAULT_CODE_KEY + LoginTypeEnum.SMS.getType() + "@" + mobile
                , code, SecurityConstants.CODE_TIME, TimeUnit.SECONDS);

        return new WebResponse<>(Boolean.TRUE, code);
    }
}
