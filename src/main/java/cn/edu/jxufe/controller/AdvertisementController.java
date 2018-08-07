package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by m1777 on 2018/8/7.
 */
@Controller
public class AdvertisementController {
    @RequestMapping("Advertisement")
    public String toAdvertisement(){
        return "guanggao";
    }
}
