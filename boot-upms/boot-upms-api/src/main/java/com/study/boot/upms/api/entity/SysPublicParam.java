
package com.study.boot.upms.api.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 公共参数配置
 *
 * @author carlos
 * @date 2019-08-21 17:40:58
 */
@Data
@TableName("sys_public_param")
@EqualsAndHashCode(callSuper = true)
public class SysPublicParam extends Model<SysPublicParam> {
private static final long serialVersionUID = 1L;

    /**
   * 编号
   */
    @TableId
    private Long publicId;
    /**
   * 公共参数名称
   */
    private String publicName;
    /**
   * 键,英文大写+下划线
   */
    private String publicKey;
    /**
   * 值
   */
    private String publicValue;
    /**
   * 状态：1有效；2无效；
   */
    private String status;
    /**
   * 创建时间
   */
    private LocalDateTime createTime;
    /**
   * 修改时间
   */
    private LocalDateTime updateTime;
    /**
   * 删除状态：0-正常；1-已删除
   */
    private String delFlag;
  

    public static final String COL_PUBLICID = "publicId";
    public static final String COL_PUBLICNAME = "publicName";
    public static final String COL_PUBLICKEY = "publicKey";
    public static final String COL_PUBLICVALUE = "publicValue";
    public static final String COL_STATUS = "status";
    public static final String COL_CREATETIME = "createTime";
    public static final String COL_UPDATETIME = "updateTime";
    public static final String COL_DELFLAG = "delFlag";
  
}
