package com.study.boot.daemon.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.study.boot.daemon.entity.ExecutionLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * 任务日志处理
 *
 * @author lishangbu
 * @date 2018/11/22
 */
@Mapper
public interface ExecutionLogMapper extends BaseMapper<ExecutionLog> {

}
