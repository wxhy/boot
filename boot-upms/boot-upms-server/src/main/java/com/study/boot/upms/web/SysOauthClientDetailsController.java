package com.study.boot.upms.web;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.study.boot.common.annotation.SysLog;
import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.api.entity.SysOauthClientDetails;
import com.study.boot.upms.service.SysOauthClientDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 终端信息表
 *
 * @author code generator
 * @date 2019-07-05 14:23:51
 */
@RestController
@AllArgsConstructor
@RequestMapping("/client")
public class SysOauthClientDetailsController {

  private final SysOauthClientDetailsService sysOauthClientDetailsService;

  /**
   * 分页查询
   * @param page 分页对象
   * @param sysOauthClientDetails 终端信息表
   * @return
   */
  @GetMapping("/page")
  public WebResponse getSysOauthClientDetailsPage(Page page, SysOauthClientDetails sysOauthClientDetails) {
    return  new WebResponse<>(sysOauthClientDetailsService.page(page,Wrappers.query(sysOauthClientDetails)));
  }


  /**
   * 通过id查询终端信息表
   * @param clientId id
   * @return WebResponse
   */
  @GetMapping("/{clientId}")
  public WebResponse getById(@PathVariable("clientId") String clientId){
    return new WebResponse<>(sysOauthClientDetailsService.getById(clientId));
  }

  /**
   * 新增终端信息表
   * @param sysOauthClientDetails 终端信息表
   * @return WebResponse
   */
  @SysLog("新增终端信息表")
  @PostMapping
  public WebResponse save(@RequestBody SysOauthClientDetails sysOauthClientDetails){
    return new WebResponse<>(sysOauthClientDetailsService.save(sysOauthClientDetails));
  }

  /**
   * 修改终端信息表
   * @param sysOauthClientDetails 终端信息表
   * @return R
   */
  @SysLog("修改终端信息表")
  @PutMapping
  public WebResponse updateById(@RequestBody SysOauthClientDetails sysOauthClientDetails){
    return new WebResponse<>(sysOauthClientDetailsService.updateById(sysOauthClientDetails));
  }

  /**
   * 通过id删除终端信息表
   * @param clientId id
   * @return WebResponse
   */
  @SysLog("删除终端信息表")
  @DeleteMapping("/{clientId}")
  public WebResponse removeById(@PathVariable String clientId){
    return new WebResponse<>(sysOauthClientDetailsService.removeById(clientId));
  }

}
