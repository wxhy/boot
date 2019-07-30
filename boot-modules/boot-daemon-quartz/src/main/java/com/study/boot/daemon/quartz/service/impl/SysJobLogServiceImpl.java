package com.study.boot.daemon.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.daemon.quartz.entity.SysJobLog;
import com.study.boot.daemon.quartz.mapper.SysJobLogMapper;
import com.study.boot.daemon.quartz.service.SysJobLogService;
import org.springframework.stereotype.Service;
/**
 * @author carlos
 */
@Service
public class SysJobLogServiceImpl extends ServiceImpl<SysJobLogMapper, SysJobLog> implements SysJobLogService{

}
