package com.study.boot.common.event;

import org.springframework.context.ApplicationEvent;


/**
 * @author Administrator
 * 系统日志事件
 */
public class SysLogEvent extends ApplicationEvent {
    /**
     * Create a new ApplicationEvent.
     *
     * @param source the object on which the event initially occurred (never {@code null})
     */
    public SysLogEvent(Object source) {
        super(source);
    }
}
