package com.study.boot.upms.web;


import com.study.boot.common.enums.CommonConstants;
import com.study.boot.common.util.WebResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {


    @GetMapping("/unLongin")
    public WebResponse unLogin(){
        return new WebResponse<>(CommonConstants.FAIL,"未登录访问");
    }

    @GetMapping("/user/info")
    public WebResponse login(){
        return new WebResponse<>(CommonConstants.SUCCESS,"已经登录了");
    }
}
