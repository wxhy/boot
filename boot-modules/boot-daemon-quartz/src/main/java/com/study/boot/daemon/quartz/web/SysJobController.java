package com.study.boot.daemon.quartz.web;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.daemon.quartz.entity.SysJob;
import com.study.boot.daemon.quartz.entity.SysJobLog;
import com.study.boot.daemon.quartz.service.SysJobLogService;
import com.study.boot.daemon.quartz.service.SysJobService;
import com.study.boot.daemon.quartz.utils.TaskUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.quartz.Scheduler;
import org.springframework.web.bind.annotation.*;

import static com.study.boot.daemon.quartz.enums.QuartzEnum.*;

/**
 * @author carlos
 */
@RestController
@AllArgsConstructor
@RequestMapping("/job")
@Api(value = "sys-job",tags = "定时任务")
public class SysJobController {

    private final Scheduler scheduler;
    private final TaskUtil taskUtil;
    private final SysJobService sysJobService;
    private final SysJobLogService sysJobLogService;

    /**
     * 分页定时任务查询
     * @param page
     * @param sysJob
     * @return
     */
    @GetMapping("/page")
    @ApiOperation(value = "分页定时业务查询")
    public WebResponse getSysJobPage(Page page, SysJob sysJob) {
        return WebResponse.builder().data(sysJobService.page(page, Wrappers.query(sysJob))).build();
    }

    /**
     * 通过id查询定时任务
     *
     * @param id id
     * @return WebResponse
     */
    @GetMapping("/{id}")
    @ApiOperation(value = "唯一标识查询定时任务")
    public WebResponse getById(@PathVariable("id") Integer id) {
        return WebResponse.builder().data(sysJobService.getById(id)).build();
    }

    /**
     * 新增定时任务
     *
     * @param sysJob 定时任务调度表
     * @return R
     */
    @SysLog("新增定时任务")
    @PostMapping
    @ApiOperation(value = "新增定时任务")
    public WebResponse save(@RequestBody SysJob sysJob) {
        sysJob.setJobStatus(JOB_STATUS_RELEASE.getType());
        sysJob.setCreateBy(SecurityUtils.getUserName());
        return WebResponse.builder().data(sysJobService.save(sysJob)).build();
    }

    /**
     * 修改定时任务
     * @param sysJob
     * @return
     */
    @SysLog("修改定时任务")
    @PutMapping
    @ApiOperation(value = "修改定时任务")
    public WebResponse updateById(@RequestBody SysJob sysJob) {
        sysJob.setUpdateBy(SecurityUtils.getUserName());
        SysJob querySysJob = this.sysJobService.getById(sysJob.getJobId());
        if(JOB_STATUS_NOT_RUNNING.getType().equals(querySysJob.getJobStatus())) {
            this.taskUtil.addOrUpdateJob(sysJob, scheduler);
            sysJobService.updateById(sysJob);
        } else if (JOB_STATUS_RELEASE.getType().equals(querySysJob.getJobStatus())) {
            sysJobService.updateById(sysJob);
        }
        return new WebResponse<>();
    }

    /**
     * 通过id删除定时任务
     *
     * @param jobId id
     * @return R
     */
    @SysLog("删除定时任务")
    @DeleteMapping("/{jobId}")
    @ApiOperation(value = "唯一标识查询定时任务，暂停任务才能删除")
    public WebResponse removeById(@PathVariable Integer jobId) {
        SysJob querySysJob = this.sysJobService.getById(jobId);
        if (JOB_STATUS_NOT_RUNNING.getType().equals(querySysJob.getJobStatus())) {
            this.taskUtil.removeJob(querySysJob, scheduler);
            this.sysJobService.removeById(jobId);
        } else if (JOB_STATUS_RELEASE.getType().equals(querySysJob.getJobStatus())) {
            this.sysJobService.removeById(jobId);
        }
        return WebResponse.builder().build();
    }


    /**
     * 暂停全部定时任务
     *
     * @return
     */
    @SysLog("暂停全部定时任务")
    @PostMapping("/shutdown-jobs")
    @ApiOperation(value = "暂停全部定时任务")
    public WebResponse shutdownJobs() {
        taskUtil.pauseJobs(scheduler);
        int count = this.sysJobService.count(new LambdaQueryWrapper<SysJob>()
                .eq(SysJob::getJobStatus, JOB_STATUS_RUNNING.getType()));
        if (count <= 0) {
            return WebResponse.builder().message("无正在运行定时任务").build();
        } else {
            //更新定时任务状态条件，运行状态2更新为暂停状态2
            this.sysJobService.update(SysJob.builder()
                    .jobStatus(JOB_STATUS_NOT_RUNNING.getType()).build(), new UpdateWrapper<SysJob>()
                    .lambda().eq(SysJob::getJobStatus, JOB_STATUS_RUNNING.getType()));
            return WebResponse.builder().message("暂停成功").build();
        }
    }

    /**
     * 启动全部定时任务
     *
     * @return
     */
    @SysLog("启动全部定时任务")
    @PostMapping("/start-jobs")
    @ApiOperation(value = "启动全部定时任务")
    public WebResponse startJobs() {
        //更新定时任务状态条件，暂停状态3更新为运行状态2
        this.sysJobService.update(SysJob.builder().jobStatus(JOB_STATUS_RUNNING
                .getType()).build(), new UpdateWrapper<SysJob>().lambda()
                .eq(SysJob::getJobStatus, JOB_STATUS_NOT_RUNNING.getType()));
        taskUtil.startJobs(scheduler);
        return WebResponse.builder().build();
    }

    /**
     * 刷新全部定时任务
     *
     * @return
     */
    @SysLog("刷新全部定时任务")
    @PostMapping("/refresh-jobs")
    @ApiOperation(value = "刷新全部定时任务")
    public WebResponse refreshJobs() {
        sysJobService.list().forEach((sysjob) -> {
            if (JOB_STATUS_RELEASE.getType().equals(sysjob.getJobStatus())
                    || JOB_STATUS_DEL.getType().equals(sysjob.getJobStatus())) {
                taskUtil.removeJob(sysjob, scheduler);
            } else if (JOB_STATUS_RUNNING.getType().equals(sysjob.getJobStatus())
                    || JOB_STATUS_NOT_RUNNING.getType().equals(sysjob.getJobStatus())) {
                taskUtil.addOrUpdateJob(sysjob, scheduler);
            } else {
                taskUtil.removeJob(sysjob, scheduler);
            }
        });
        return WebResponse.builder().build();
    }

    /**
     * 启动定时任务
     *
     * @param jobId
     * @return
     */
    @SysLog("启动定时任务")
    @PostMapping("/start-job/{id}")
    @ApiOperation(value = "启动定时任务")
    public WebResponse startJob(@PathVariable("id") Integer jobId) {
        SysJob querySysJob = this.sysJobService.getById(jobId);
        if (querySysJob != null && JOB_LOG_STATUS_FAIL.getType()
                .equals(querySysJob.getJobStatus())) {
            taskUtil.addOrUpdateJob(querySysJob, scheduler);
        } else {
            taskUtil.resumeJob(querySysJob, scheduler);
        }
        //更新定时任务状态条件，暂停状态3更新为运行状态2
        this.sysJobService.updateById(SysJob.builder().jobId(jobId)
                .jobStatus(JOB_STATUS_RUNNING.getType()).build());
        return WebResponse.builder().build();
    }

    /**
     * 暂停定时任务
     *
     * @return
     */
    @SysLog("暂停定时任务")
    @PostMapping("/shutdown-job/{id}")
    @ApiOperation(value = "暂停定时任务")
    public WebResponse shutdownJob(@PathVariable("id") Integer id) {
        SysJob querySysJob = this.sysJobService.getById(id);
        //更新定时任务状态条件，运行状态2更新为暂停状态3
        this.sysJobService.updateById(SysJob.builder().jobId(querySysJob.getJobId())
                .jobStatus(JOB_STATUS_NOT_RUNNING.getType()).build());
        taskUtil.pauseJob(querySysJob, scheduler);
        return WebResponse.builder().build();
    }

    /**
     * 唯一标识查询定时执行日志
     *
     * @return
     */
    @GetMapping("/job-log")
    @ApiOperation(value = "唯一标识查询定时执行日志")
    public WebResponse getJobLog(Page page, SysJobLog sysJobLog) {
        return WebResponse.builder().data(sysJobLogService.page(page, Wrappers.query(sysJobLog))).build();
    }

    /**
     * 检验任务名称和任务组联合是否唯一
     *
     * @return
     */
    @GetMapping("/is-valid-task-name")
    @ApiOperation(value = "检验任务名称和任务组联合是否唯一")
    public WebResponse isValidTaskName(@RequestParam String jobName, @RequestParam String jobGroup) {
        return WebResponse.builder().data(this.sysJobService
                .count(Wrappers.query(SysJob.builder().jobName(jobName).jobGroup(jobGroup).build())) > 0
                ? CommonConstants.FAIL : CommonConstants.SUCCESS).build();
    }
}
