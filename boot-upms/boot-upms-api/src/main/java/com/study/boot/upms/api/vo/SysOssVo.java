package com.study.boot.upms.api.vo;

import com.study.boot.upms.api.entity.SysOss;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Administrator
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysOssVo extends SysOss {

    private String url;
}
