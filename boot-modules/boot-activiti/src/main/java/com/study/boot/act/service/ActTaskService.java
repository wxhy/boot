package com.study.boot.act.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.study.boot.act.dto.CommentDto;

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
