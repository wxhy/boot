package com.study.boot.act.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.study.boot.act.dto.ProcessDefDTO;

import java.io.InputStream;
import java.util.Map;

/**
 * @author Administrator
 */
public interface ProcessService {

    /**
     * 分页流程列表
     *
     * @param params
     * @return
     */
    IPage<ProcessDefDTO> getProcessByPage(Map<String, Object> params);

    /**
     * 读取xml/image资源
     *
     * @param procDefId
     * @param proInsId
     * @param resType
     * @return
     */
    InputStream readResource(String procDefId, String proInsId, String resType);

    /**
     * 更新状态
     *
     * @param status
     * @param procDefId
     * @return
     */
    Boolean updateStatus(String status, String procDefId);

    /**
     * 删除流程实例
     *
     * @param deploymentId
     * @return
     */
    Boolean removeProcIns(String deploymentId);

    /**
     * 启动流程、更新请假单状态
     *
     * @param leaveId
     * @return
     */
    Boolean saveStartProcess(String leaveId);
}
