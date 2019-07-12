
package com.study.boot.pan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.vo.FileDetailVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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
     * @param virtualAddress
     * @return
     */
    List<FileDetailVo> getFileDetailList(VirtualAddress virtualAddress);


    /**
     * 上传文件
     * @param multipartFile
     * @param parentId 父ID
     * @return
     */
    Boolean uploadFile(MultipartFile multipartFile, Long parentId);


    /**
     * 检查是否存在同名文件,并返回修改后的文件名
     * @param fileName 文件名称
     * @param fileType 文件类型
     * @param parentId 父ID
     * @return
     */
    String checkExist(String fileName, FileContants.FileType fileType,Long parentId);
}
