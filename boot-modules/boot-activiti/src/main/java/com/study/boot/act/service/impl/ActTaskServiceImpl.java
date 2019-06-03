package com.study.boot.act.service.impl;

import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.act.dto.CommentDto;
import com.study.boot.act.dto.TaskDTO;
import com.study.boot.act.service.ActTaskService;
import com.study.boot.common.enums.PaginationConstants;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.*;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class ActTaskServiceImpl implements ActTaskService {

    private final RepositoryService repositoryService;
    private final TaskService taskService;
    private final RuntimeService runtimeService;
    private final ProcessEngine processEngine;
    private final HistoryService historyService;

    @Override
    public IPage getTaskByName(Map<String, Object> params, String name) {
        int page = MapUtil.getInt(params, PaginationConstants.CURRENT);
        int limit = MapUtil.getInt(params, PaginationConstants.SIZE);
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(name);

        IPage result = new Page(page, limit);
        result.setTotal(taskQuery.count());
        List<TaskDTO> taskDTOList = taskQuery.listPage((page - 1) * limit, limit)
                .stream()
                .map(task -> {
                    TaskDTO dto = new TaskDTO();
                    dto.setTaskId(task.getId());
                    dto.setTaskName(task.getName());
                    dto.setProcessInstanceId(task.getProcessInstanceId());
                    dto.setNodeKey(task.getTaskDefinitionKey());
                    dto.setCategory(task.getCategory());
                    dto.setTime(task.getCreateTime());
                    return dto;
                }).collect(Collectors.toList());
        result.setRecords(taskDTOList);
        return result;
    }

    @Override
    public List<CommentDto> getCommentByTaskId(String taskId) {
        //使用当前的任务ID，查询当前流程对应的历史任务ID
        //使用当前任务ID，获取当前任务对象
        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();

        //获取流程实例ID
        List<CommentDto> commentDtos = taskService.getProcessInstanceComments(task.getProcessInstanceId())
                .stream()
                .map(comment -> {
                    CommentDto commentDto = new CommentDto();
                    commentDto.setId(comment.getId());
                    commentDto.setTime(comment.getTime());
                    commentDto.setType(comment.getType());
                    commentDto.setTaskId(comment.getTaskId());
                    commentDto.setUserId(comment.getUserId());
                    commentDto.setFullMessage(comment.getFullMessage());
                    commentDto.setProcessInstanceId(comment.getProcessInstanceId());
                    return commentDto;
                }).collect(Collectors.toList());

        return commentDtos;
    }

    /**
     * 追踪图片节点
     *
     * @param id
     */
    @Override
    public InputStream viewByTaskId(String id) {
        //使用当前任务ID，获取当前任务对象
        Task task = taskService.createTaskQuery()
                .taskId(id)
                .singleResult();

        String processInstanceId = task.getProcessInstanceId();

        //获取流程实例
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();
        //获取历史流程实例
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();

        String processDefinitionId = null;
        List<String> executedActivityIdList = new ArrayList<>();
        if(processInstance != null) {
            //流程未结束
            processDefinitionId = processInstance.getProcessDefinitionId();
            executedActivityIdList = this.runtimeService.getActiveActivityIds(processInstance.getId());
        }else if(historicProcessInstance != null) {
            //流程已结束
            processDefinitionId = historicProcessInstance.getProcessDefinitionId();
            executedActivityIdList = historyService.createHistoricActivityInstanceQuery()
                    .processInstanceId(processInstanceId)
                    .orderByHistoricActivityInstanceId().asc().list()
                    .stream().map(HistoricActivityInstance::getActivityId)
                    .collect(Collectors.toList());
        }

        BpmnModel bpmnModel = this.repositoryService.getBpmnModel(processDefinitionId);
        ProcessEngineConfiguration engconf  = processEngine.getProcessEngineConfiguration();
        ProcessDiagramGenerator generator = engconf.getProcessDiagramGenerator();
        return generator.generateDiagram(bpmnModel, "png",
                executedActivityIdList, Collections.emptyList(),
                engconf.getActivityFontName(),
                engconf.getLabelFontName(),
                engconf.getAnnotationFontName(),
                engconf.getClassLoader(),
                1.0,
                true);
    }
}
