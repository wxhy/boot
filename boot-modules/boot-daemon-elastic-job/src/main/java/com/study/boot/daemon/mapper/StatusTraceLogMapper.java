package com.study.boot.daemon.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.daemon.entity.StatusTraceLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * 任务轨迹处理
 *
 * @author lishangbu
 * @date 2018/11/22
 */

@Mapper
public interface StatusTraceLogMapper extends BaseMapper<StatusTraceLog> {

}
