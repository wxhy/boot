package com.study.boot.pay.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.pay.entitiy.PayInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayInfoMapper extends BaseMapper<PayInfo> {
}