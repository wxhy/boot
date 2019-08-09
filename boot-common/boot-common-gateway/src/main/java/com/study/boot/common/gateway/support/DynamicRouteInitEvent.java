package com.study.boot.common.gateway.support;

import org.springframework.context.ApplicationEvent;

/**
 * 路由初始化事件
 * @author carlos
 */
public class DynamicRouteInitEvent extends ApplicationEvent {
    /**
     * Create a new ApplicationEvent.
     *
     * @param source the object on which the event initially occurred (never {@code null})
     */
    public DynamicRouteInitEvent(Object source) {
        super(source);
    }
}
