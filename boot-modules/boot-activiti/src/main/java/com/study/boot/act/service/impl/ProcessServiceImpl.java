package com.study.boot.act.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.act.dto.ProcessDefDTO;
import com.study.boot.act.entity.LeaveBill;
import com.study.boot.act.service.LeaveBillService;
import com.study.boot.act.service.ProcessService;
import com.study.boot.common.enums.PaginationConstants;
import com.study.boot.common.enums.ProcessStatusEnum;
import com.study.boot.common.enums.ResourceTypeEnum;
import com.study.boot.common.enums.TaskStatusEnum;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.repository.ProcessDefinitionQuery;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@Service
@Slf4j
@AllArgsConstructor
public class ProcessServiceImpl implements ProcessService {

    private final RepositoryService repositoryService;
    private final LeaveBillService leaveBillService;
    private final RuntimeService runtimeService;

    @Override
    public IPage<ProcessDefDTO> getProcessByPage(Map<String, Object> params) {
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        String category = MapUtil.getStr(params, "category");
        if (StrUtil.isNotBlank(category)) {
            query.processDefinitionCategory(category);
        }

        int page = MapUtil.getInt(params, PaginationConstants.CURRENT);
        int limit = MapUtil.getInt(params, PaginationConstants.SIZE);

        IPage result = new Page(page, limit);
        result.setTotal(query.count());

        List<ProcessDefDTO> deploymentList = query.listPage((page - 1) * limit, limit)
                .stream()
                .map(processDefinition -> {
                    Deployment deployment = repositoryService.createDeploymentQuery()
                            .deploymentId(processDefinition.getDeploymentId())
                            .singleResult();
                    return ProcessDefDTO.toProcessDefDTO(processDefinition, deployment);
                }).collect(Collectors.toList());
        result.setRecords(deploymentList);
        return result;
    }

    /**
     * 读取xml/image资源
     * @param procDefId 流程定义ID
     * @param proInsId 流程实例ID
     * @param resType 结果类型
     * @return
     */
    @Override
    public InputStream readResource(String procDefId, String proInsId, String resType) {
        if(StrUtil.isBlank(procDefId)) {
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                    .processInstanceId(proInsId)
                    .singleResult();
            procDefId = processInstance.getProcessDefinitionId();
        }

        ProcessDefinition processDefinition = repositoryService
                .createProcessDefinitionQuery()
                .processDefinitionId(procDefId)
                .singleResult();
        String resourceName = "";
        if (ResourceTypeEnum.IMAGE.getType().equals(resType)) {
            resourceName = processDefinition.getDiagramResourceName();
        } else if (ResourceTypeEnum.XML.getType().equals(resType)) {
            resourceName = processDefinition.getResourceName();
        }
        InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
        return resourceAsStream;
    }

    /**
     * 更新状态
     *
     * @param status
     * @param procDefId
     * @return
     */
    @Override
    public Boolean updateStatus(String status, String procDefId) {
        if (ProcessStatusEnum.ACTIVE.getStatus().equals(status)) {
            repositoryService.activateProcessDefinitionById(procDefId, true, null);
        } else if (ProcessStatusEnum.SUSPEND.getStatus().equals(status)) {
            repositoryService.suspendProcessDefinitionById(procDefId, true, null);
        }
        return Boolean.TRUE;
    }

    /**
     * 删除部署的流程，级联删除流程实例
     *
     * @param deploymentId
     * @return
     */
    @Override
    public Boolean removeProcIns(String deploymentId) {
        repositoryService.deleteDeployment(deploymentId, true);
        return Boolean.TRUE;
    }

    /**
     * 启动流程实例
     * @param leaveId
     * @return
     */
    @Override
    public Boolean saveStartProcess(String leaveId) {
        LeaveBill leaveBill = leaveBillService.getById(leaveId);
        leaveBill.setState(TaskStatusEnum.CHECK.getStatus());

        String key = leaveBill.getClass().getSimpleName();
        String businessKey = key + "_" + leaveBill.getLeaveId();
        ProcessDefinition definition = repositoryService.createProcessDefinitionQuery()
                .processDefinitionKey(key)
                .latestVersion()
                .singleResult();

        ProcessInstance instance = runtimeService.startProcessInstanceByKey(key, businessKey);
        leaveBill.setProDefinitionId(definition.getId());
        leaveBill.setProInstanceId(instance.getId());
        leaveBillService.updateById(leaveBill);
        return Boolean.TRUE;
    }
}
