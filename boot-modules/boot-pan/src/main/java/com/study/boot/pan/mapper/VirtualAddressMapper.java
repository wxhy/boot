package com.study.boot.pan.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.vo.FileDetailVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 虚拟地址表
 *
 * @author code generator
 * @date 2019-07-09 17:40:11
 */
@Mapper
public interface VirtualAddressMapper extends BaseMapper<VirtualAddress> {

    /**
     * 分页查询文件
     * @param page
     * @param virtualAddress
     * @return
     */
    IPage<List<FileDetailVo>> getFileDetailVoByPage(Page page,@Param("query") VirtualAddress virtualAddress);
}
