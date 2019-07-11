package com.study.boot.pan.web;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.service.VirtualAddressService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
@RestController
@AllArgsConstructor
@RequestMapping("/virtualaddress")
public class PanController {

    private final VirtualAddressService virtualAddressService;

    /**
     * 分页查询
     *
     * @param page           分页对象
     * @param virtualAddress 虚拟地址表
     * @return
     */
    @GetMapping("/page")
    public WebResponse getVirtualAddressPage(Page page, VirtualAddress virtualAddress) {
        return new WebResponse<>(virtualAddressService.getFileDetailByPage(page,virtualAddress));
    }


    /**
     * 通过id查询虚拟地址表
     *
     * @param id id
     * @return WebResponse
     */
    @GetMapping("/{id}")
    public WebResponse getById(@PathVariable("id") Long id) {
        return new WebResponse<>(virtualAddressService.getById(id));
    }

    /**
     * 创建文件夹
     *
     * @param virtualAddress 虚拟地址表
     * @return WebResponse
     */
    @SysLog("创建文件夹")
    @PostMapping
    public WebResponse save(@RequestBody VirtualAddress virtualAddress) {
        return virtualAddressService.createFolder(virtualAddress);
    }

    /**
     * 修改虚拟地址表
     *
     * @param virtualAddress 虚拟地址表
     * @return R
     */
    @SysLog("修改虚拟地址表")
    @PutMapping
    public WebResponse updateById(@RequestBody VirtualAddress virtualAddress) {
        return new WebResponse<>(virtualAddressService.updateById(virtualAddress));
    }

    /**
     * 通过id删除虚拟地址表
     *
     * @param id id
     * @return WebResponse
     */
    @SysLog("删除虚拟地址表")
    @DeleteMapping("/{id}")
    public WebResponse removeById(@PathVariable Long id) {
        return new WebResponse<>(virtualAddressService.removeById(id));
    }

}
