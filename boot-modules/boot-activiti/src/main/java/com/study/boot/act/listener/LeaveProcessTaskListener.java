package com.study.boot.act.listener;

import cn.hutool.core.collection.CollUtil;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.util.SpringContextHolder;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysUser;
import com.study.boot.upms.api.feign.RemoteUserService;
import lombok.extern.slf4j.Slf4j;
import org.flowable.task.service.delegate.DelegateTask;
import org.flowable.engine.delegate.TaskListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 请假流程监听器
 * @author Administrator
 */
@Slf4j
public class LeaveProcessTaskListener implements TaskListener {


    /**
     * 查询提交人的上级
     *
     * @param delegateTask
     */
    @Override
    public void notify(DelegateTask delegateTask) {
        RemoteUserService remoteUserService = SpringContextHolder.getBean(RemoteUserService.class);
        SimpMessagingTemplate simpMessagingTemplate = SpringContextHolder.getBean(SimpMessagingTemplate.class);

        WebResponse<List<SysUser>> result = remoteUserService.ancestorUsers(SecurityUtils.getUserName());
        List<String> remindUserList = new ArrayList<>();
        if (CollUtil.isEmpty(result.getData())) {
            log.info("用户 {} 不存在上级,任务单由当前用户审批", SecurityUtils.getUserName());
            delegateTask.addCandidateUser(SecurityUtils.getUserName());
            remindUserList.add(SecurityUtils.getUserName());
        } else {
            List<String> userList = result.getData().stream().map(SysUser::getUsername).collect(Collectors.toList());
            log.info("当前任务 {}，由 {}处理", delegateTask.getId(), userList);
            delegateTask.addCandidateUsers(userList);
            remindUserList.addAll(userList);
        }

        remindUserList.forEach(user -> {
            simpMessagingTemplate.convertAndSendToUser(SecurityUtils.getUserName(), "/remind", delegateTask.getName());
        });
    }
}
