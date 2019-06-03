package com.study.boot.act.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import org.flowable.engine.repository.Model;

import java.util.Map;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 19:57
 */

public interface ModelService {

    /**
     * 创建流程
     * @param name
     * @param key
     * @param category
     * @param description
     * @return
     */
    Model create(String name, String key, String category, String description);

    /**
     * 分页获取流程
     *
     * @param params
     * @return
     */
    IPage<Model> getModelPage(Map<String, Object> params);

    /**
     * 删除流程
     * @param id
     * @return
     */
    Boolean removeModelById(String id);

    /**
     * 部署流程
     * @param id
     * @return
     */
    Boolean deploy(String id);
}
