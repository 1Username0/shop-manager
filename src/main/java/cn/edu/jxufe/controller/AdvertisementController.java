package cn.edu.jxufe.controller;

import cn.edu.jxufe.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by m1777 on 2018/8/7.
 */
@Controller
public class AdvertisementController {

    @Autowired
    private AdvertisementService advertisementService;

    @RequestMapping("advertisement")
    public String toAdvertisement(){
        return "guanggao";
    }

    @RequestMapping("advertisementdata")
    @ResponseBody
    public Object advertisementdata(){
        try {
            return advertisementService.finAll();
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }
}
