package com.study.boot.act.dto;

import com.study.boot.act.entity.LeaveBill;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class LeaveBillDto extends LeaveBill {
    /**
     * 任务ID
     */
    private String taskId;

    /**
     * 任务提交时间
     */
    private Date time;

    /**
     * 批准信息
     */
    private String comment;

    /**
     * 连线信息
     */
    private List<String> flagList;

    private String taskFlag;
}
