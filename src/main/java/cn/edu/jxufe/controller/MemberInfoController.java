package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.MemberInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by m1777 on 2018/8/9.
 */
@Controller
public class MemberInfoController {
    @Autowired
    private MemberInfoService memberInfoService;

    @RequestMapping("memberinfo")
    public String tomemberinfo(){
        return "huiyuan";
    }

    @RequestMapping("memberinfodata")
    @ResponseBody
    public Object tomemberinfodata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
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

    @RequestMapping("memberinfodatabypro")
    @ResponseBody
    public Object memberinfodatabypro(String pn,String pv, @RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Memberinfo> data= memberInfoService.findMemberinfoByProperty(pn,pv,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("memberinfodatabytime")
    @ResponseBody
    public Object memberinfodatabytime(Date startTime,Date endTime, @RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Memberinfo> data= memberInfoService.findMemberinfoByTime(startTime,endTime,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("memberinfobyid")
    public Object tomemberinfobyid(int id,ModelMap map){
        Memberinfo mem=memberInfoService.findMemberinfoByIdService(id);
        map.put("mem",mem);
        return "huiyuanbianji";
    }

    @RequestMapping("deletememberinfobyid")
    @ResponseBody
    public Object todeletememberinfobyid(int id){
        return memberInfoService.deleteMemberinfoByIdService(id);
    }

    @RequestMapping("insertmemberinfo")
    public Object toinsertmemberinfo(Memberinfo mem){
        return memberInfoService.insertMemberinfoService(mem);
    }

    @RequestMapping("updatememberinfobyid")
    @ResponseBody
    public Object toupdatememberinfobyid(Memberinfo memberinfo){
        return memberInfoService.updateMemberinfoByIdService(memberinfo);
    }

    @RequestMapping("savemem")
    @ResponseBody
    public Object savemem(Memberinfo memberinfo){
        return memberInfoService.updateMemberinfoByIdService(memberinfo);
    }

    @RequestMapping("insertmem")
    @ResponseBody
    public Object insertmem(Memberinfo memberinfo){
        return memberInfoService.insertMemberinfoService(memberinfo);
    }



}
