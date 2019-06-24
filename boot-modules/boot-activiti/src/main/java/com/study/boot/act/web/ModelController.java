package com.study.boot.act.web;


import com.study.boot.act.dto.ModelForm;
import com.study.boot.act.service.ModelService;
import com.study.boot.common.util.WebResponse;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/model")
@AllArgsConstructor
@Api(value="model",description = "模型管理模块")
public class ModelController {

    private final ModelService modelService;


    /**
     * 分页获取model
     * @param params
     * @return
     */
    @GetMapping
    public WebResponse getModelPage(@RequestParam Map<String,Object> params){
        return new WebResponse<>(modelService.getModelPage(params));
    }

    /**
     *  保存Model
     * @param name
     * @param key
     * @param desc
     * @param category
     * @return
     */
    @PostMapping
    public WebResponse createModel(@RequestParam String name, @RequestParam String key,
                                   @RequestParam String desc, @RequestParam String category){
        return new WebResponse<>(modelService.create(name,key,category,desc));
    }

    @PostMapping("/insert")
    public WebResponse createModel(@RequestBody @Valid ModelForm form) {
        return new WebResponse<>(modelService.create(form.getName(),form.getKey(),form.getCategory(),form.getDesc()));
    }


    @DeleteMapping("/{id}")
    public WebResponse removeModelById(@PathVariable String id) {
        return new WebResponse<>(modelService.removeModelById(id));
    }

    @PostMapping("/deploy/{id}")
    public WebResponse deploy(@PathVariable String id){
        return new WebResponse<>(modelService.deploy(id));
    }



}
