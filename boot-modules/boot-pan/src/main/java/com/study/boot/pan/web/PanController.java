package com.study.boot.pan.web;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.ContentType;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.constants.CommonConstants;
import com.study.boot.common.oss.constant.FileContants;
import com.study.boot.common.oss.service.MinioTemplate;
import com.study.boot.common.util.WebResponse;
import com.study.boot.pan.entity.Chunk;
import com.study.boot.pan.entity.SysFile;
import com.study.boot.pan.entity.VirtualAddress;
import com.study.boot.pan.service.ChunkService;
import com.study.boot.pan.service.SysFileService;
import com.study.boot.pan.service.VirtualAddressService;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;


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

    private final ChunkService chunkService;

    private final SysFileService sysFileService;

    private final MinioTemplate minioTemplate;


    /**
     * @param virtualAddress 虚拟地址表
     * @return
     */
    @GetMapping("/page")
    public WebResponse getVirtualAddressPage(VirtualAddress virtualAddress) {
        virtualAddress.setDelFlag(CommonConstants.STATUS_NORMAL);
        return new WebResponse<>(virtualAddressService.getFileDetailList(virtualAddress));
    }

    /**
     * 获取子文件夹
     *
     * @param parentId
     * @return
     */
    @GetMapping("/subFolder/{parentId}")
    public WebResponse getSubFolder(@PathVariable Long parentId) {
        VirtualAddress virtualAddress = new VirtualAddress();
        virtualAddress.setParentId(parentId);
        virtualAddress.setType(FileContants.FileType.FOLDER.toString());
        return this.getVirtualAddressPage(virtualAddress);
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
     * 重命名
     *
     * @param fileName 虚拟地址表
     * @return WebResponse
     */
    @SysLog("重命名")
    @PutMapping("/{id}")
    public WebResponse renameById(@PathVariable Long id, @RequestParam("fileName") String fileName) {
        VirtualAddress virtualAddress = this.virtualAddressService.getById(id);
        if (virtualAddress != null && virtualAddress.getFileName().equals(fileName)) {
            return new WebResponse<>(CommonConstants.FAIL, "不能和原文件名相同");
        }
        List<VirtualAddress> addresses = this.virtualAddressService.list(Wrappers.<VirtualAddress>query()
                .lambda()
                .eq(VirtualAddress::getFileName, fileName)
                .eq(VirtualAddress::getType, virtualAddress.getType()));
        if (CollectionUtil.isNotEmpty(addresses)) {
            return new WebResponse<>(CommonConstants.FAIL, "存在同名文件");
        }
        virtualAddress.setFileName(fileName);
        return new WebResponse<>(virtualAddressService.updateById(virtualAddress));
    }

    /**
     * 通过id删除虚拟地址表
     *
     * @param id id
     * @return WebResponse
     */
    @SysLog("删除文件")
    @DeleteMapping("/{id}")
    public WebResponse removeById(@PathVariable Long id) {
        VirtualAddress virtualAddress = virtualAddressService.getById(id);
        virtualAddress.setDelFlag(CommonConstants.STATUS_DEL);
        return new WebResponse<>(virtualAddressService.updateById(virtualAddress));
    }

    /**
     * 移动文件
     *
     * @param id
     * @param parentId
     * @return
     */
    @PutMapping("/move/{id}/{parentId}")
    public WebResponse move(@PathVariable("id") Long id, @PathVariable("parentId") Long parentId) {
        VirtualAddress virtualAddress = this.virtualAddressService.getById(id);
        virtualAddress.setParentId(parentId);
        String fileName = this.virtualAddressService.checkExist(virtualAddress.getFileName(), FileContants.FileType.valueOf(virtualAddress.getType()), parentId);
        virtualAddress.setFileName(fileName);
        return new WebResponse<>(this.virtualAddressService.updateById(virtualAddress));
    }

    /**
     * 复制文件
     *
     * @param id
     * @param parentId
     * @return
     */
    @PutMapping("/copy/{id}/{parentId}")
    public WebResponse copy(@PathVariable("id") Long id, @PathVariable("parentId") Long parentId) {
        VirtualAddress address = virtualAddressService.getById(id);
        String fileName = this.virtualAddressService.checkExist(address.getFileName(), FileContants.FileType.valueOf(address.getType()), parentId);
        VirtualAddress target = new VirtualAddress();
        target.setParentId(parentId);
        target.setFileName(fileName);
        target.setMd5(address.getMd5());
        target.setType(address.getType());
        target.setFileId(address.getFileId());
        return new WebResponse<>(virtualAddressService.save(target));
    }


    /**
     * 下载
     *
     * @return
     */
    @GetMapping("/download/{id}")
    @SneakyThrows
    public WebResponse download(@PathVariable("id") Long id, HttpServletResponse response) {
        VirtualAddress virtualAddress = this.virtualAddressService.getById(id);
        SysFile file = sysFileService.getById(virtualAddress.getFileId());
        String url = minioTemplate.getObjectURL(CommonConstants.BUCKET_NAME, file.getFilePath(),1);
        return new WebResponse<>(url);
    }


    /**
     * 上传Chunk
     *
     * @param chunk
     * @return
     */
    @PostMapping("/chunk")
    public WebResponse uplodaChunk(Chunk chunk) {
        return new WebResponse<>(chunkService.uploadChunk(chunk));
    }

    /**
     * 检查chunk
     *
     * @param chunk
     * @return
     */
    @GetMapping("/chunk")
    public WebResponse checkChunk(Chunk chunk) {
        return new WebResponse<>(chunkService.checkChunk(chunk));
    }

    /**
     * 合并chunk
     *
     * @param md5
     * @return
     */
    @GetMapping("/merge/{md5}/{parentId}/{name}")
    public WebResponse mergeChunk(@PathVariable("md5") String md5,
                                  @PathVariable("parentId") Long parentId,
                                  @PathVariable("name") String name) {
        return new WebResponse<>(chunkService.mergeChunk(md5, parentId,name));
    }


}
