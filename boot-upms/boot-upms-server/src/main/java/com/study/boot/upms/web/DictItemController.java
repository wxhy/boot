package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysDictItem;
import com.study.boot.upms.service.SysDictItemService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author Administrator
 */
@RequestMapping("/dict/item")
@RestController
@AllArgsConstructor
@Api(tags = "字典项管理")
public class DictItemController {

    private SysDictItemService sysDictItemService;

    /**
     * 分页查询字典项
     * @param sysDictItem
     * @return
     */
    @GetMapping("/page")
    public WebResponse page(SysDictItem sysDictItem) {
        return new WebResponse<>(sysDictItemService.list(Wrappers.query(sysDictItem)));
    }

    /**
     * 获取字典项详情
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public WebResponse getById(@PathVariable Integer id) {
        return new WebResponse<>(this.sysDictItemService.getById(id));
    }

    /**
     * 保存
     * @param sysDictItem
     * @return
     */
    @PostMapping
    public WebResponse save(@RequestBody SysDictItem sysDictItem) {
        return new WebResponse<>(this.sysDictItemService.save(sysDictItem));
    }

    /**
     * 修改
     * @param sysDictItem
     * @return
     */
    @PutMapping
    public WebResponse updateById(@RequestBody SysDictItem sysDictItem){
        return new WebResponse<>(this.sysDictItemService.updateById(sysDictItem));
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public WebResponse removeById(@PathVariable Integer id) {
        return new WebResponse(this.sysDictItemService.removeById(id));
    }
}
