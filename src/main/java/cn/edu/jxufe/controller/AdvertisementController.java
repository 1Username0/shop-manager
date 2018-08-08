package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Advertisement;
import cn.edu.jxufe.service.AdvertisementService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

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
    public Object advertisementdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Advertisement> data= advertisementService.finAll(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }


}
