package com.study.boot.act.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.act.dto.CommentDto;
import com.study.boot.act.dto.LeaveBillDto;
import com.study.boot.act.dto.TaskDTO;
import com.study.boot.act.entity.LeaveBill;
import com.study.boot.act.listener.UpdateHiTaskReasonCommand;
import com.study.boot.act.mapper.LeaveBillMapper;
import com.study.boot.act.service.ActTaskService;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.constants.PaginationConstants;
import com.study.boot.common.enums.TaskStatusEnum;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowNode;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.*;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.*;
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
    private final LeaveBillMapper leaveBillMapper;
    private final ManagementService managementService;

    @Override
    public IPage getTaskByName(Map<String, Object> params, String name) {
        int page = MapUtil.getInt(params, PaginationConstants.CURRENT);
        int limit = MapUtil.getInt(params, PaginationConstants.SIZE);
        TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateOrAssigned(name);

        IPage result = new Page(page, limit);
        result.setTotal(taskQuery.count());
        List<TaskDTO> taskDTOList = taskQuery.orderByTaskCreateTime().desc()
                .listPage((page - 1) * limit, limit)
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
    public Task getTask(String id) {
        return taskService.createTaskQuery().taskId(id).singleResult();
    }


    @Override
    public List<CommentDto> getCommentByInstanceId(String proInstanceId) {
        //获取流程实例ID
        List<CommentDto> commentDtos = taskService.getProcessInstanceComments(proInstanceId)
                .stream()
                .map(comment -> {
                    HistoricTaskInstance taskInstance = historyService.createHistoricTaskInstanceQuery()
                            .taskId(comment.getTaskId())
                            .singleResult();
                    CommentDto commentDto = new CommentDto();
                    commentDto.setId(comment.getId());
                    commentDto.setType(comment.getType());
                    commentDto.setTaskId(comment.getTaskId());
                    commentDto.setUserId(comment.getUserId());
                    commentDto.setFullMessage(comment.getFullMessage());
                    commentDto.setProcessInstanceId(comment.getProcessInstanceId());
                    commentDto.setDeleteReason(taskInstance.getDeleteReason());
                    commentDto.setTaskName(taskInstance.getName());
                    commentDto.setTime(taskInstance.getTime());
                    commentDto.setEndTime(taskInstance.getEndTime());
                    return commentDto;
                }).collect(Collectors.toList());

        return commentDtos;
    }

    /**
     * 追踪图片节点
     *
     * @param proInstanceId
     */
    @Override
    public InputStream viewCurrentStep(String proInstanceId) {
        //获取流程实例
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(proInstanceId)
                .singleResult();
        //获取历史流程实例
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                .processInstanceId(proInstanceId)
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
                    .processInstanceId(proInstanceId)
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

    /**
     * 通过任务ID查询任务信息关联申请单信息
     *
     * @param taskId
     * @return
     */
    @Override
    public LeaveBillDto getTaskById(String taskId) {
        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();

        ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                .processInstanceId(task.getProcessInstanceId())
                .singleResult();

        String businessKey = pi.getBusinessKey();
        if (StrUtil.isNotBlank(businessKey)) {
            businessKey = businessKey.split("_")[1];
        }

        List<String> comeList = findOutFlagListByTaskId(task, pi);
        LeaveBill leaveBill = leaveBillMapper.selectById(businessKey);

        LeaveBillDto leaveBillDto = new LeaveBillDto();
        BeanUtils.copyProperties(leaveBill, leaveBillDto);
        leaveBillDto.setTaskId(taskId);
        leaveBillDto.setTime(task.getCreateTime());
        leaveBillDto.setFlagList(comeList);
        return leaveBillDto;
    }

    /**
     * 提交任务
     *
     * @param leaveBillDto
     * @return
     */
    @Override
    public Boolean submitTask(LeaveBillDto leaveBillDto) {
        String taskId = leaveBillDto.getTaskId();
        String message = leaveBillDto.getComment();
        Integer id = leaveBillDto.getLeaveId();

        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();

        String processInstanceId = task.getProcessInstanceId();
        Authentication.setAuthenticatedUserId(SecurityUtils.getUserName());
        taskService.addComment(taskId, processInstanceId, message);

        Map<String, Object> variables = new HashMap<>(1);
        variables.put("result", leaveBillDto.getTaskFlag());
        variables.put("days", leaveBillDto.getDays());

        taskService.complete(taskId, variables);
        managementService.executeCommand(new UpdateHiTaskReasonCommand(taskId,leaveBillDto.getTaskFlag()));
        ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();

        if (pi == null) {
            LeaveBill bill = new LeaveBill();
            bill.setLeaveId(id);
            bill.setState(StrUtil.equals(TaskStatusEnum.OVERRULE.getDescription()
                    , leaveBillDto.getTaskFlag()) ? TaskStatusEnum.OVERRULE.getStatus()
                    : TaskStatusEnum.COMPLETED.getStatus());
            leaveBillMapper.updateById(bill);
        }
        return null;
    }

    private List<String> findOutFlagListByTaskId(Task task, ProcessInstance pi) {
        //获取当前活动完成之后连线的名称
        Execution execution = runtimeService.createExecutionQuery().executionId(task.getExecutionId()).singleResult();


        BpmnModel bpmnModel = repositoryService.getBpmnModel(pi.getProcessDefinitionId());
        FlowNode flowNode =(FlowNode)  bpmnModel.getFlowElement(execution.getActivityId());
        List<SequenceFlow> outgoingFlows = flowNode.getOutgoingFlows();


        List<String> activityIds = outgoingFlows.stream()
                .map(SequenceFlow::getName).collect(Collectors.toList());


        return activityIds;
    }

}
