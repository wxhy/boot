package com.study.boot.upms.api.vo;

import com.study.boot.upms.api.entity.SysMessageSend;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Administrator
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class MessageSendVo extends SysMessageSend {

    private String typeName;
}
