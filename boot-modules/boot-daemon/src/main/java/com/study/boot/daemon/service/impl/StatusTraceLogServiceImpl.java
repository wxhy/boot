package com.study.boot.daemon.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.daemon.entity.StatusTraceLog;
import com.study.boot.daemon.mapper.StatusTraceLogMapper;
import com.study.boot.daemon.service.StatusTraceLogService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 任务轨迹处理
 *
 * @author lishangbu
 * @date 2018/11/22
 */
@Service
@AllArgsConstructor
public class StatusTraceLogServiceImpl extends ServiceImpl<StatusTraceLogMapper, StatusTraceLog> implements StatusTraceLogService {

}
