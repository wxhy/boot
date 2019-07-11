package com.study.boot.pan.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.mapper.VirtualAddressMapper;
import com.study.boot.pan.service.VirtualAddressService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
@Service
public class VirtualAddressServiceImpl extends ServiceImpl<VirtualAddressMapper, VirtualAddress> implements VirtualAddressService {


    /**
     * 创建文件夹
     * @param virtualAddress
     * @return
     */
    @Override
    public WebResponse createFolder(VirtualAddress virtualAddress) {
        List<VirtualAddress> addressList = this.baseMapper.selectList(Wrappers.query(virtualAddress));
        if(CollectionUtil.isNotEmpty(addressList)) {
            return new WebResponse<>(CommonConstants.FAIL,"已存在的文件夹名称");
        }

        virtualAddress.setType(FileContants.FileType.FOLDER.toString());
        virtualAddress.setDelFlag(CommonConstants.STATUS_NORMAL);
        this.baseMapper.insert(virtualAddress);
        return new WebResponse<>(CommonConstants.SUCCESS);
    }

    /**
     * 分页查询
     * @param page
     * @param virtualAddress
     * @return
     */
    @Override
    public IPage getFileDetailByPage(Page page, VirtualAddress virtualAddress) {
        return this.baseMapper.getFileDetailVoByPage(page,virtualAddress);
    }
}
