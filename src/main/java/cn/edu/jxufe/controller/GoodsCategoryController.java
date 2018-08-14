package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.GoodsCategory;
import cn.edu.jxufe.service.GoodsCategoryService;
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
public class GoodsCategoryController {

    @Autowired
    private GoodsCategoryService goodsCategoryService;

    @RequestMapping("goodscategory")
    public String togoodscategory() {
        return "leibie";
    }

    @RequestMapping("goodscategorydata")
    @ResponseBody
    public Object togoodscategorydata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsCategory> data= goodsCategoryService.finAll(page, rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("goodscategorydatabypro")
     @ResponseBody
     public Object goodscategorydatabypro(String pn,String pv,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsCategory> data= goodsCategoryService.findGoodsCategoryByProperty(pn,pv,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("goodscategorydatabytime")
    @ResponseBody
    public Object goodscategorydatabytime(int startTime,int endTime,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsCategory> data= goodsCategoryService.findGoodsCategoryByTime(startTime, endTime, page, rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("goodscategorybyid")
    public Object togoodscategorybyid(int id,ModelMap map){
        GoodsCategory goodsCategory=goodsCategoryService.findGoodsCategoryByIdService(id);
        map.put("goodsCategory",goodsCategory);
        return "leibiebianji";
    }

    @RequestMapping("deletegoodscategorybyid")
    @ResponseBody
    public Object todeletegoodscategorybyid(int id){
        return goodsCategoryService.deleteGoodsCategoryByIdService(id);
    }

    @RequestMapping("updategoodscategorybyid")
    @ResponseBody
    public Object toupdategoodscategorybyid(GoodsCategory goodsCategory){
        return goodsCategoryService.updateGoodsCategoryByIdService(goodsCategory);
    }

    @RequestMapping("insertgoodscategory")
    @ResponseBody
    public Object toinsertgoodscategory(GoodsCategory goodsCategory){
        return goodsCategoryService.insertGoodsCategoryService(goodsCategory);
    }

    @RequestMapping("saveGoodsCategory")
    @ResponseBody
    public Object saveGoodsCategory(GoodsCategory goodsCategory){
        return goodsCategoryService.updateGoodsCategoryByIdService(goodsCategory);
    }

    @RequestMapping("insertgoodsCategory")
    @ResponseBody
    public Object insertgoodsCategory(GoodsCategory goodsCategory){
        return goodsCategoryService.insertGoodsCategoryService(goodsCategory);
    }
}
