package com.study.boot.common.exception;

/**
 * @author Carlos
 * @version 1.0
 * @date 2019/5/29 21:10
 */
public class ValidateCodeException extends RuntimeException {

    public ValidateCodeException() {
    }

    public ValidateCodeException(String msg) {
        super(msg);
    }
}
