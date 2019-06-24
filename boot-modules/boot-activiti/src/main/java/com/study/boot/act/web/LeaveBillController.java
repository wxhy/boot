package com.study.boot.act.web;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.act.entity.LeaveBill;
import com.study.boot.act.service.LeaveBillService;
import com.study.boot.act.service.ProcessService;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.enums.TaskStatusEnum;
import com.study.boot.common.util.WebResponse;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/leave-bill")
@AllArgsConstructor
@Api(value="leave",description = "请假管理模块")
public class LeaveBillController {

    private final LeaveBillService leaveBillService;
    private final ProcessService processService;


    /**
     * 请假审批单简单分页查询
     * @param page
     * @param leaveBill
     * @return
     */
    @GetMapping("/page")
    public WebResponse getLeaveBillPage(Page page, LeaveBill leaveBill) {
        return new WebResponse<>(leaveBillService.page(page, Wrappers.query(leaveBill)));
    }

    /**
     * 获取请假信息
     * @param leaveId
     * @return
     */
    @GetMapping("/{leaveId}")
    public WebResponse getById(@PathVariable String leaveId) {
        return new WebResponse<>(leaveBillService.getById(leaveId));
    }

    /**
     * 保存
     * @param leaveBill
     * @return
     */
    @PostMapping
    @SysLog("新建请假流程")
    public WebResponse saveLeaveBill(@RequestBody LeaveBill leaveBill) {
        leaveBill.setUsername(SecurityUtils.getUserName());
        leaveBill.setState(TaskStatusEnum.UNSUBMIT.getStatus());
        return new WebResponse<>(leaveBillService.save(leaveBill));
    }

    /**
     * 修改
     * @param leaveBill
     * @return
     */
    @PutMapping
    @SysLog("修改请假流程")
    public WebResponse updateById(@RequestBody LeaveBill leaveBill) {
        return new WebResponse<>(leaveBillService.updateById(leaveBill));
    }

    /**
     * 删除
     *
     * @param leaveId
     * @return R
     */
    @DeleteMapping("/{leaveId}")
    @SysLog("删除请假流程")
    public WebResponse removeById(@PathVariable Integer leaveId) {
        return new WebResponse<>(leaveBillService.removeById(leaveId));
    }

    /**
     * 提交请假流程
     *
     * @param leaveId
     * @return R
     */
    @GetMapping("/submit/{leaveId}")
    @SysLog("发起请假流程审批")
    public WebResponse submit(@PathVariable String leaveId) {
        return new WebResponse<>(processService.saveStartProcess(leaveId));
    }
}
