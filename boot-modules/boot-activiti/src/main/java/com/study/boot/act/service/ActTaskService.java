package com.study.boot.act.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.study.boot.act.dto.CommentDto;
import com.study.boot.act.dto.LeaveBillDto;

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
     * 获取流程审核历史
     * @param params
     * @return
     */
    IPage getTaskHistory(Map<String, Object> params);


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
     * 通过任务ID 查询批注信息
     *
     * @param taskId 任务ID
     * @return
     */
    List<CommentDto> getCommentByTaskId(String taskId);

    /**
     * 追踪图片节点
     *
     * @param id
     * @return
     */
    InputStream viewByTaskId(String id);


}
