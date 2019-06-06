package com.study.boot.act.listener;

import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.task.service.TaskService;


/**
 * @author Administrator
 */
public class UpdateHiTaskReasonCommand implements Command<Void> {

    protected String taskId;
    protected String deleteReason;


    public UpdateHiTaskReasonCommand(String taskId, String deleteReason) {
        this.taskId = taskId;
        this.deleteReason = deleteReason;
    }

    @Override
    public Void execute(CommandContext commandContext) {
        TaskService taskService = CommandContextUtil.getTaskService();
        return null;
    }
}
