package com.study.boot.act.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.study.boot.act.service.ModelService;
import com.study.boot.common.enums.PaginationConstants;
import com.study.boot.common.enums.SecurityConstants;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.editor.constants.ModelDataJsonConstants;
import org.flowable.editor.language.json.converter.BpmnJsonConverter;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.Model;
import org.flowable.engine.repository.ModelQuery;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 19:58
 */
@Service
@AllArgsConstructor
@Slf4j
public class ModelServiceImpl implements ModelService {
    private static final String BPMN20_XML = ".bpmn20.xml";
    private final ObjectMapper objectMapper;
    private final RepositoryService repositoryService;

    /**
     * 创建流程
     * @param name
     * @param key
     * @param category
     * @param description
     * @return
     */
    @Override
    public Model create(String name, String key, String category, String description) {
        try {
            //保存model
            Model model = repositoryService.newModel();
            model.setCategory(category);
            model.setKey(key);
            model.setName(name);
            long version = repositoryService.createModelQuery().modelKey(key).count() + 1;
            model.setVersion((int)version);
            ObjectNode infoNode = objectMapper.createObjectNode();
            infoNode.put(ModelDataJsonConstants.MODEL_NAME, name);
            infoNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION,description);
            infoNode.put(ModelDataJsonConstants.MODEL_REVISION, version);
            model.setMetaInfo(infoNode.toString());
            repositoryService.saveModel(model);


            ObjectNode editorNode = objectMapper.createObjectNode();
            editorNode.put("id", "canvas");
            editorNode.put("resourceId", "canvas");
            ObjectNode properties = objectMapper.createObjectNode();
            properties.put("process_author", SecurityConstants.PROJECT_LICENSE);
            editorNode.set("properties", properties);
            editorNode.set("stencilset", objectMapper.createObjectNode()
                    .put("namespace", "http://b3mn.org/stencilset/bpmn2.0#"));
            repositoryService.addModelEditorSource(model.getId(),editorNode.toString().getBytes(CharsetUtil.UTF_8));
            return model;
        }catch (UnsupportedEncodingException e){
            log.error("UnsupportedEncodingException",e);
        }
        return null;
    }

    /**
     *
     * @param params
     * @return
     */
    @Override
    public IPage<Model> getModelPage(Map<String, Object> params) {
        ModelQuery modelQuery = repositoryService.createModelQuery()
                .latestVersion().orderByLastUpdateTime().desc();
        String category = (String) params.get("category");
        if (StrUtil.isNotBlank(category)) {
            modelQuery.modelCategory(category);
        }

        int page = MapUtil.getInt(params, PaginationConstants.CURRENT);
        int limit = MapUtil.getInt(params, PaginationConstants.SIZE);

        IPage result = new Page(page, limit);
        result.setTotal(modelQuery.count());
        result.setRecords(modelQuery.listPage((page - 1) * limit, limit));
        return result;
    }

    /**
     * 删除流程
     * @param id
     * @return
     */
    @Override
    public Boolean removeModelById(String id) {
        repositoryService.deleteModel(id);
        return Boolean.TRUE;
    }

    @Override
    public Boolean deploy(String id) {
        try {
            Model model = repositoryService.getModel(id);
            JsonNode node = objectMapper.readTree(repositoryService.getModelEditorSource(model.getId()));
            BpmnModel bpmnModel = new BpmnJsonConverter().convertToBpmnModel(node);

            String processName = model.getName();
            if(!StrUtil.endWithIgnoreCase(processName,BPMN20_XML)){
                processName+= BPMN20_XML;
            }

            //部署流程
            Deployment deployment = repositoryService.createDeployment()
                    .name(model.getName())
                    .addBpmnModel(processName, bpmnModel)
                    .deploy();

            //设置流程分类
            List<ProcessDefinition> processDefinitions = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).list();
            processDefinitions.forEach(processDefinition -> {
                repositoryService.setProcessDefinitionCategory(processDefinition.getId(),model.getCategory());
            });


        }catch (Exception e){
            log.error("部署失败，异常", e);
        }
        return Boolean.TRUE;
    }
}
