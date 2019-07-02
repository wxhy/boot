package com.study.boot.act.web;


import cn.hutool.core.io.IoUtil;
import com.study.boot.act.service.ProcessService;
import com.study.boot.common.enums.ResourceTypeEnum;
import com.study.boot.common.util.WebResponse;
import io.swagger.annotations.Api;
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
@RequestMapping("/process")
@RestController
@AllArgsConstructor
@Api(tags = "流程管理")
public class ProcessController {

    private final ProcessService processService;

    @GetMapping
    public WebResponse list(@RequestParam Map<String, Object> params) {
        return new WebResponse<>(processService.getProcessByPage(params));
    }


    @GetMapping(value = "/resource/{proInsId}/{proceDefId}/{resType}")
    public ResponseEntity resourceRead(@PathVariable String proInsId,@PathVariable String proceDefId,@PathVariable String resType){
        InputStream inputStream = processService.readResource(proceDefId, proInsId, resType);
        HttpHeaders headers = new HttpHeaders();
        if(ResourceTypeEnum.XML.getType().equals(resType)) {
            headers.setContentType(MediaType.APPLICATION_XML);
        } else {
            headers.setContentType(MediaType.IMAGE_PNG);
        }

        return new ResponseEntity<>(IoUtil.readBytes(inputStream),headers, HttpStatus.CREATED);
    }

    @PutMapping("/status/{procDefId}/{status}")
    public WebResponse updateState(@PathVariable String procDefId, @PathVariable String status) {
        return new WebResponse<>(processService.updateStatus(status, procDefId));
    }

    @DeleteMapping("/{deploymentId}")
    public WebResponse deleteProcIns(@PathVariable String deploymentId) {
        return new WebResponse<>(processService.removeProcIns(deploymentId));
    }
}
