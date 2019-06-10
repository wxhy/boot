package com.study.boot.act.web;

import cn.hutool.core.io.IoUtil;
import com.study.boot.act.dto.LeaveBillDto;
import com.study.boot.act.service.ActTaskService;
import com.study.boot.common.auth.util.SecurityUtils;
import com.study.boot.common.util.WebResponse;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.InputStream;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/task")
@AllArgsConstructor
public class TaskController {

    private final ActTaskService actTaskService;

    @GetMapping("/todo")
    public WebResponse todo(@RequestParam Map<String, Object> params) {
        return new WebResponse<>(actTaskService.getTaskByName(params, SecurityUtils.getUserName()));
    }

    @GetMapping("/{id}")
    public WebResponse getTaskById(@PathVariable String id) {
        return new WebResponse(actTaskService.getTaskById(id));
    }

    @PostMapping
    public WebResponse submitTask(@RequestBody LeaveBillDto leaveBillDto) {
        return new WebResponse(actTaskService.submitTask(leaveBillDto));
    }

    /**
     *
     * @param id 流程实例ID
     * @return
     */
    @GetMapping("/view/{id}")
    public ResponseEntity viewCurrentImage(@PathVariable String id) {
        InputStream imageStream = actTaskService.viewCurrentStep(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(IoUtil.readBytes(imageStream), headers, HttpStatus.CREATED);
    }

    /**
     *
     * @param id 流程实例ID
     * @return
     */
    @GetMapping("/comment/{id}")
    public WebResponse commitList(@PathVariable String id) {
        return new WebResponse<>(actTaskService.getCommentByInstanceId(id));
    }


}
