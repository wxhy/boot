package com.study.boot.upms.api.vo;

import com.study.boot.upms.api.entity.SysMessage;
import lombok.Data;

import java.util.List;

/**
 * @author Administrator
 */
@Data
public class MessageVo extends SysMessage {

    /**
     * 会员ID集合
     */
    private List<Integer> userIds;


}
