package com.study.boot.daemon.quartz.event;


import com.study.boot.daemon.quartz.entity.SysJobLog;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author carlos
 */
@Getter
@AllArgsConstructor
public class SysJobLogEvent {

    private SysJobLog sysJobLog;
}
