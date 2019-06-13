package com.study.boot.upms.api.vo;

import com.study.boot.upms.api.entity.SysMessage;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author Administrator
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MessageVo extends SysMessage {

    /**
     * 会员ID集合
     */
    private List<Integer> userIds;


}
