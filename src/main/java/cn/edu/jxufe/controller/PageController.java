package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by m1777 on 2018/8/6.
 */
@Controller
public class PageController {
    @RequestMapping("page_{url}")
    public String toPage(@PathVariable("url") String url){
        System.out.println("页面路径==>"+url);
        return url;
    }
}
