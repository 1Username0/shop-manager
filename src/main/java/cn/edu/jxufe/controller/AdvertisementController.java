package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.Advertisement;
import cn.edu.jxufe.service.AdvertisementService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
    public Object toadvertisementdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
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

    @RequestMapping("advertisementdatabypro")
    @ResponseBody
    public Object advertisementdatabypro(String pn,String pv,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Advertisement> data= advertisementService.findAdvertisementByProperty(pn,pv,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("advertisementdatabytime")
    @ResponseBody
    public Object advertisementdatabytime(Date startTime,Date endTime,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<Advertisement> data= advertisementService.findAdvertisementByTime(startTime,endTime,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("advertisementbyid")
    public Object toAdvertisementbyid(int id,ModelMap map){
        Advertisement adv=advertisementService.findAdvertisementByIdService(id);
        map.put("adv",adv);
        return "guanggaobianji";
    }

    @RequestMapping("deleteadvertisementbyid")
    @ResponseBody
    public Object todeleteadvertisementbyid(int id){
        return advertisementService.deleteAdvertisementByIdService(id);
    }

    @RequestMapping("updateadvertisementbyid")
    @ResponseBody
    public Object toupdateadvertisementbyid(Advertisement advertisement){
         return advertisementService.updateAdvertisementByIdService(advertisement);
    }

    @RequestMapping("insertadvertisement")
    @ResponseBody
    public Object toinsertadvertisement(Advertisement advertisement){
        return advertisementService.insertAdvertisementService(advertisement);
    }

    @RequestMapping("udloadimage1")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("f")MultipartFile f,HttpServletRequest req){
        System.out.println("准备文件上传");
        System.out.println(f.getOriginalFilename());
        String path=req.getSession().getServletContext().getRealPath("upload/");
        System.out.println(path);
        String fileName= UUID.randomUUID().toString()+f.getOriginalFilename();
        try {
            FileOutputStream fou=new FileOutputStream(path+fileName);
            fou.write(f.getBytes());
            fou.close();
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("savead")
    @ResponseBody
    public Object savead(Advertisement advertisement){
        return advertisementService.updateAdvertisementByIdService(advertisement);
    }

    @RequestMapping("insertadv")
    @ResponseBody
    public Object insertmem(Advertisement advertisement){
        return advertisementService.insertAdvertisementService(advertisement);
    }
}
