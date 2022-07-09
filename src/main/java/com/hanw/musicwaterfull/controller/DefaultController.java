package com.hanw.musicwaterfull.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author hanW
 * @create 2022-06-24 22:55
 */
/*
并非是最终版，为了跑通逻辑
 */
//@Controller 注解是专门用于处理 Http 请求处理的，是以 MVC 为核心的设计思想的控制层。@RestController 则是 @Controller 的衍生注解。
@RestController
//@RequestMapping( "/hello")
public class DefaultController {
//    @GetMapping
    @RequestMapping("/")
    public String sayHello(){
        return "王涵";
    }
}
