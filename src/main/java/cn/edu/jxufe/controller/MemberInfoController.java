package cn.edu.jxufe.controller;

/**
 * Created by m1777 on 2018/8/9.
 */
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.MemberInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


public class MemberInfoController {
    @Autowired
    private MemberInfoService memberInfoService;

    @RequestMapping("memberinfo")
    public String tomemberinfo(){
        return "huiyuan";
    }

    @RequestMapping("memberinfodata")
    @ResponseBody
    public Object memberinfodata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Memberinfo> data= memberInfoService.finAll(page,rows);
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