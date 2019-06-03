package com.study.boot.common.util;

import com.study.boot.common.enums.CommonConstants;
import lombok.*;

import java.io.Serializable;

/**
 * 通用返回结果
 * @author Administrator
 */
@Data
@Builder
@AllArgsConstructor
public class WebResponse<T> implements Serializable {

    @Getter
    @Setter
    @Builder.Default
    private Integer code  = CommonConstants.SUCCESS;

    @Getter
    @Setter
    private String message;

    @Getter
    @Setter
    private T data;

    public WebResponse() {
        super();
    }

    public WebResponse(Integer code,String message) {
       this(code,message,null);
    }
    public WebResponse(Integer code,T data){
        this(code, null, data);
    }
    public WebResponse(T data) {
        this(CommonConstants.SUCCESS, null, data);
    }

    public WebResponse(T data, String message) {
        this(CommonConstants.SUCCESS,message,data);
    }

    public WebResponse(Throwable e) {
        super();
        this.message = e.getMessage();
        this.code = CommonConstants.FAIL;
    }
}
