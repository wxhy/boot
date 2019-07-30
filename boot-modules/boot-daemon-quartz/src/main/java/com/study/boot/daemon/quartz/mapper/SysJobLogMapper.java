package com.study.boot.daemon.quartz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.daemon.quartz.entity.SysJobLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author carlos
 */
@Mapper
public interface SysJobLogMapper extends BaseMapper<SysJobLog> {
}