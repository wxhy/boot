package com.study.boot.upms.web;

import com.study.boot.common.util.WebResponse;
import com.study.boot.upms.service.MobileService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RestController
@RequestMapping("/mobile")
@AllArgsConstructor
public class MobileController {

    private final MobileService mobileService;


    @GetMapping("/{mobile}")
    public WebResponse sendSmsCode(@PathVariable String mobile) {
        return mobileService.sendSmsCode(mobile);
    }

}
