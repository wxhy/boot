package com.study.boot.upms.web;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysDict;
import com.study.boot.upms.service.SysDictService;
import lombok.AllArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 字典表 前端控制器
 * @author Administrator
 */
@RestController
@RequestMapping("/dict")
@AllArgsConstructor
public class DictController {

    private final SysDictService sysDictService;


    /**
     * 通过ID查询字典信息
     *
     * @param id ID
     * @return 字典信息
     */
    @GetMapping("/{id}")
    public WebResponse getDictById(@PathVariable Integer id) {
        return new WebResponse<>(sysDictService.getById(id));
    }

    /**
     * 分页查询字典信息
     *
     * @param page 分页对象
     * @return 分页对象
     */
    @GetMapping("/page")
    public WebResponse<IPage> getDictPage(Page page, SysDict sysDict) {
        return new WebResponse<>(sysDictService.page(page,Wrappers.query(sysDict)));
    }

    /**
     * 通过字典类型查找字典
     *
     * @param type 类型
     * @return 同类型字典
     */
    @GetMapping("/type/{type}")
    public WebResponse getDictByType(@PathVariable String type) {
        return new WebResponse<>(sysDictService.list(Wrappers.<SysDict>query()
        .lambda().eq(SysDict::getType,type)));
    }

    /**
     * 添加字典
     *
     * @param sysDict 字典信息
     * @return success、false
     */
    @SysLog("添加字典")
    @PostMapping
    @Cacheable
    public WebResponse save(@Valid @RequestBody SysDict sysDict) {
        return new WebResponse<>(sysDictService.save(sysDict));
    }

    /**
     * 删除字典，并且清除字典缓存
     *
     * @param id   ID
     * @param type 类型
     * @return R
     */
    @SysLog("删除字典")
    @DeleteMapping("/{id}/{type}")
    public WebResponse removeById(@PathVariable Integer id, @PathVariable String type) {
        return new WebResponse<>(sysDictService.removeById(id));
    }

    /**
     * 修改字典
     *
     * @param sysDict 字典信息
     * @return success/false
     */
    @PutMapping
    @SysLog("修改字典")
    public WebResponse updateById(@Valid @RequestBody SysDict sysDict) {
        return new WebResponse<>(sysDictService.updateById(sysDict));
    }
}
