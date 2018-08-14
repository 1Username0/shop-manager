package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Articleinfo;
import cn.edu.jxufe.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by m1777 on 2018/8/8.
 */
@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("atricle")
    public String toarticle(){
        return "wenzhang";
    }

    @RequestMapping("atricledata")
    @ResponseBody
    public Object toarticledata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Articleinfo> data= articleService.finAll(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("atricledatabypro")
    @ResponseBody
    public Object atriclebydatabypro(String pn,String pv,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Articleinfo> data= articleService.findArticleinfoByProperty(pn,pv,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("atricledatabytime")
    @ResponseBody
    public Object memberinfodatabytime(int startTime,int endTime, @RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Articleinfo> data= articleService.findArticleinfoByTime(startTime, endTime, page, rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }


    @RequestMapping("atriclebyid")
    public Object toatriclebyid(int id,ModelMap map){
        Articleinfo art=articleService.findArticleinfoByIdService(id);
        map.put("art",art);
        return "wenzhangbianji";
    }

    @RequestMapping("deleteatriclebyid")
    @ResponseBody
    public Object todeleteatriclebyid(int id){
        return articleService.deleteArticleinfoByIdService(id);
    }

    @RequestMapping("updateatriclebyid")
    @ResponseBody
    public Object toupdateatriclebyid(Articleinfo articleinfo){
        return articleService.updateArticleinfoByIdService(articleinfo);
    }

    @RequestMapping("insertatriclebyid")
    @ResponseBody
    public Object toinsertatriclebyid(Articleinfo articleinfo){
        return articleService.insertArticleinfoService(articleinfo);
    }

    @RequestMapping("saveart")
    @ResponseBody
    public Object saveart(Articleinfo articleinfo){
        return articleService.updateArticleinfoByIdService(articleinfo);
    }

    @RequestMapping("insertart")
    @ResponseBody
    public Object insertmem(Articleinfo articleinfo){
        return articleService.insertArticleinfoService(articleinfo);
    }
}
