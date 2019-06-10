package com.study.boot.act.listener;

import org.flowable.common.engine.impl.db.DbSqlSession;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.task.service.impl.persistence.entity.HistoricTaskInstanceEntity;


/**
 * 标记完成原因
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
        HistoricTaskInstanceEntity historicTaskInstance = CommandContextUtil.getDbSqlSession()
                .selectById(HistoricTaskInstanceEntity.class, taskId);
        if(historicTaskInstance != null) {
            historicTaskInstance.setDeleteReason(deleteReason);
            DbSqlSession dbSqlSession = CommandContextUtil.getDbSqlSession();
            dbSqlSession.update(historicTaskInstance);
        }
        return null;
    }
}
