package com.study.boot.pan.web;


import com.study.boot.pan.service.VirtualAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author carlos
 */
@RestController
@RequestMapping("/lcn-test")
public class TestController {

    @Autowired
    private VirtualAddressService virtualAddressService;


    @GetMapping
    public void get(){
        virtualAddressService.saveLcn();
    }
}
