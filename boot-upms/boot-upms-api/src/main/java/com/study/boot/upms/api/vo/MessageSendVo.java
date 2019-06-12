package com.study.boot.upms.api.vo;

import com.study.boot.upms.api.entity.SysMessageSend;
import lombok.Data;

/**
 * @author Administrator
 */

@Data
public class MessageSendVo extends SysMessageSend {

    private String typeName;
}
