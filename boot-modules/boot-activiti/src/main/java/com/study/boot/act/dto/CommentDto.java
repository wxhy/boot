package com.study.boot.act.dto;

import lombok.Data;

import java.util.Date;

/**
 * @author Administrator
 */
@Data
public class CommentDto {
    /**
     * unique identifier for this comment
     */
    private String id;

    /**
     * reference to the user that made the comment
     */
    private String userId;

    /**
     * 创建时间
     * time and date when the user made the comment
     */
    private Date time;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * reference to the task on which this comment was made
     */
    private String taskId;

    /**
     * 任务名称
     */
    private String taskName;

    /**
     * 审批操作
     */
    private String deleteReason;

    /**
     * reference to the process instance on which this comment was made
     */
    private String processInstanceId;

    /**
     * reference to the type given to the comment
     */
    private String type;

    /**
     * the full comment message the user had related to the task and/or process instance
     */
    private String fullMessage;
}
