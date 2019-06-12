package com.study.boot.upms.compoment;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.upms.api.entity.SysDict;
import com.study.boot.upms.service.SysDictService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 同步数据字典
 * @author Administrator
 */
@Component
public class DictSyncRunner implements CommandLineRunner {

    @Autowired
    private SysDictService sysDictService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    @SneakyThrows
    public void run(String... args) {
        List<SysDict> dicts = sysDictService.list(Wrappers.emptyWrapper());
        dicts.stream().forEach(dict-> redisTemplate.opsForValue().set(CommonConstants.DICTS + dict.getType()+":"+dict.getValue(),dict.getLabel()));
    }
}
