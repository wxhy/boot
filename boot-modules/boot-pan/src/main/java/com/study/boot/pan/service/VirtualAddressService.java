
package com.study.boot.pan.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.VirtualAddress;

/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
public interface VirtualAddressService extends IService<VirtualAddress> {

    /**
     * 创建文件夹
     * @param virtualAddress
     * @return
     */
    WebResponse createFolder(VirtualAddress virtualAddress);


    /**
     * 分页查询
     * @param page
     * @param virtualAddress
     * @return
     */
    IPage getFileDetailByPage(Page page,VirtualAddress virtualAddress);

}
