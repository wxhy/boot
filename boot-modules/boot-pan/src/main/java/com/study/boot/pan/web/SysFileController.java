package com.study.boot.pan.generator.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.util.WebResponse;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.pan.generator.entity.SysFile;
import com.study.boot.pan.generator.service.SysFileService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 文件表
 *
 * @author code generator
 * @date 2019-07-09 17:40:21
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sysfile")
public class SysFileController {

  private final  SysFileService sysFileService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param sysFile 文件表
   * @return
   */
  @GetMapping("/page")
  public WebResponse getSysFilePage(Page page, SysFile sysFile) {
    return  new WebResponse<>(sysFileService.page(page,Wrappers.query(sysFile)));
  }


  /**
   * 通过id查询文件表
   * @param fileId id
   * @return WebResponse
   */
  @GetMapping("/{fileId}")
  public WebResponse getById(@PathVariable("fileId") String fileId){
    return new WebResponse<>(sysFileService.getById(fileId));
  }

  /**
   * 新增文件表
   * @param sysFile 文件表
   * @return WebResponse
   */
  @SysLog("新增文件表")
  @PostMapping
  public WebResponse save(@RequestBody SysFile sysFile){
    return new WebResponse<>(sysFileService.save(sysFile));
  }

  /**
   * 修改文件表
   * @param sysFile 文件表
   * @return R
   */
  @SysLog("修改文件表")
  @PutMapping
  public WebResponse updateById(@RequestBody SysFile sysFile){
    return new WebResponse<>(sysFileService.updateById(sysFile));
  }

  /**
   * 通过id删除文件表
   * @param fileId id
   * @return WebResponse
   */
  @SysLog("删除文件表")
  @DeleteMapping("/{fileId}")
  public WebResponse removeById(@PathVariable String fileId){
    return new WebResponse<>(sysFileService.removeById(fileId));
  }

}
