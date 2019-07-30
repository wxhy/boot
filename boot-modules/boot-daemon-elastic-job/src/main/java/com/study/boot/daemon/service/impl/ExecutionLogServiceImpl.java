package com.study.boot.daemon.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.daemon.entity.ExecutionLog;
import com.study.boot.daemon.mapper.ExecutionLogMapper;
import com.study.boot.daemon.service.ExecutionLogService;
import org.springframework.stereotype.Service;

/**
 * 任务日志处理
 *
 * @author lishangbu
 * @date 2018/11/22
 */
@Service
public class ExecutionLogServiceImpl extends ServiceImpl<ExecutionLogMapper, ExecutionLog> implements ExecutionLogService {

}
