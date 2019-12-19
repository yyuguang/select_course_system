package com.lnzz.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * ClassName：IndexController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 19:34
 * @Description:
 */
@RestController
public class IndexController {

    @GetMapping("/index")
    public ModelAndView index(){
        return  new ModelAndView("index");
    }


}
