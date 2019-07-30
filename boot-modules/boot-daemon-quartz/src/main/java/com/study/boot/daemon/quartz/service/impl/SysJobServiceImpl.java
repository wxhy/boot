package com.study.boot.daemon.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.mapper.SysJobMapper;
import com.study.boot.daemon.quartz.service.SysJobService;
import org.springframework.stereotype.Service;
/**
 * @author carlos
 */
@Service
public class SysJobServiceImpl extends ServiceImpl<SysJobMapper, SysJob> implements SysJobService{

}
