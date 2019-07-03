package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysDictItem;
import com.study.boot.upms.service.SysDictItemService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
    @Cacheable(value = "dict_item_details",key = "#id")
    public WebResponse getById(@PathVariable Integer id) {
        return new WebResponse<>(this.sysDictItemService.getById(id));
    }


    /**
     * 通过字典类型查找字典
     *
     * @param type 类型
     * @return 同类型字典
     */
    @GetMapping("/type/{type}")
    @Cacheable(value = "dict_items",key = "#type")
    public WebResponse getDictByType(@PathVariable String type) {
        return new WebResponse<>(sysDictItemService.list(Wrappers.<SysDictItem>query()
                .lambda().eq(SysDictItem::getType,type)));
    }


    /**
     * 保存
     * @param sysDictItem
     * @return
     */
    @PostMapping
    @CacheEvict(value = "dict_items",key = "#sysDictItem.type")
    public WebResponse save(@RequestBody SysDictItem sysDictItem) {
        return new WebResponse<>(this.sysDictItemService.save(sysDictItem));
    }

    /**
     * 修改
     * @param sysDictItem
     * @return
     */
    @PutMapping
    @CacheEvict(value = "dict_items",key = "#sysDictItem.type")
    public WebResponse updateById(@RequestBody SysDictItem sysDictItem){
        return new WebResponse<>(this.sysDictItemService.updateById(sysDictItem));
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @DeleteMapping("/{id}/{type}")
    @CacheEvict(value = "dict_items",key = "#type")
    public WebResponse removeById(@PathVariable Integer id,@PathVariable String type) {
        return new WebResponse<>(this.sysDictItemService.removeById(id));
    }
}
