package com.study.boot.daemon.quartz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.daemon.quartz.entity.SysJob;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author carlos
 */
@Mapper
public interface SysJobMapper extends BaseMapper<SysJob> {
}