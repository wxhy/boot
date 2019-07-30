package com.study.boot.daemon.quartz.event;


import com.study.boot.daemon.quartz.entity.SysJob;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.quartz.Trigger;

/**
 * @author carlos
 */
@Getter
@AllArgsConstructor
public class SysJobEvent {

    private final SysJob sysJob;

    private final Trigger trigger;
}
