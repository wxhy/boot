package com.study.boot.daemon.quartz.exception;

/**
 * 定时任务异常
 * @author carlos
 */
public class TaskException extends Exception {

    public TaskException() {
        super();
    }

    public TaskException(String msg) {
        super(msg);
    }
}
