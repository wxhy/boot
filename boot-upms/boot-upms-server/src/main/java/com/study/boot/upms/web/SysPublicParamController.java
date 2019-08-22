package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysPublicParam;
import com.study.boot.upms.service.SysPublicParamService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 公共参数配置
 *
 * @author carlos
 * @date 2019-08-21 17:40:58
 */
@RestController
@AllArgsConstructor
@RequestMapping("/param")
public class SysPublicParamController {

  private final  SysPublicParamService sysPublicParamService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param sysPublicParam 公共参数配置
   * @return
   */
  @GetMapping("/page")
  public WebResponse getSysPublicParamPage(Page page, SysPublicParam sysPublicParam) {
    return  new WebResponse<>(sysPublicParamService.page(page,Wrappers.query(sysPublicParam)));
  }


  /**
   * 通过id查询公共参数配置
   * @param publicId id
   * @return WebResponse
   */
  @GetMapping("/{publicId}")
  public WebResponse getById(@PathVariable("publicId") Long publicId){
    return new WebResponse<>(sysPublicParamService.getById(publicId));
  }

  /**
   * 新增公共参数配置
   * @param sysPublicParam 公共参数配置
   * @return WebResponse
   */
  @SysLog("新增公共参数配置")
  @PostMapping
  public WebResponse save(@RequestBody SysPublicParam sysPublicParam){
    return new WebResponse<>(sysPublicParamService.save(sysPublicParam));
  }

  /**
   * 修改公共参数配置
   * @param sysPublicParam 公共参数配置
   * @return R
   */
  @SysLog("修改公共参数配置")
  @PutMapping
  public WebResponse updateById(@RequestBody SysPublicParam sysPublicParam){
    return new WebResponse<>(sysPublicParamService.updateById(sysPublicParam));
  }

  /**
   * 通过id删除公共参数配置
   * @param publicId id
   * @return WebResponse
   */
  @SysLog("删除公共参数配置")
  @DeleteMapping("/{publicId}")
  public WebResponse removeById(@PathVariable Long publicId){
    return new WebResponse<>(sysPublicParamService.removeById(publicId));
  }

}
