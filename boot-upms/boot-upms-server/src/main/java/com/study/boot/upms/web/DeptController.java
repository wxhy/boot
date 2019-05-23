package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.dto.DeptTree;
import com.study.boot.upms.api.util.TreeUtils;
import com.study.boot.upms.service.SysDeptService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/dept")
@AllArgsConstructor
public class DeptController {

    private final SysDeptService sysDeptService;

    /**
     * 获取部门树
     * @return
     */
    @GetMapping("/tree")
    public WebResponse listDeptTrees(){
        return WebResponse.builder().data(sysDeptService.listDeptTrees()).build();
    }

}
