package com.study.boot.act.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.study.boot.act.dto.CommentDto;
import com.study.boot.act.dto.LeaveBillDto;
import org.flowable.task.api.Task;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */

public interface ActTaskService {

    /**
     * 获取用户代办列表
     *
     * @param params
     * @param name
     * @return
     */
    IPage getTaskByName(Map<String, Object> params, String name);

    /**
     * 获取任务
     * @param id
     * @return
     */
    Task getTask(String id);


    /**
     * 通过任务ID查询任务信息关联申请单信息
     *
     * @param id
     * @return
     */
    LeaveBillDto getTaskById(String id);

    /**
     * 提交任务
     *
     * @param leaveBillDto
     * @return
     */
    Boolean submitTask(LeaveBillDto leaveBillDto);


    /**
     * 通过流程实例ID 查询批注信息
     *
     * @param proInstanceId 流程实例ID
     * @return
     */
    List<CommentDto> getCommentByInstanceId(String proInstanceId);

    /**
     * 追踪图片节点
     *
     * @param  proInstanceId 流程实例ID
     * @return
     */
    InputStream viewCurrentStep(String proInstanceId);


}
