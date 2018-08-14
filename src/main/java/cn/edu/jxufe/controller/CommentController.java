package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.service.CommentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by m1777 on 2018/8/8.
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("comment")
    public String tocomment(){
        return "pinglun";
    }

    @RequestMapping("commentdata")
    @ResponseBody
    public Object tocommentdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsComment> data= commentService.finAll(page, rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("commentdatabypro")
    @ResponseBody
    public Object commentdatabypro(String pn,String pv,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsComment> data= commentService.findGoodsCommentByProperty(pn, pv, page, rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("commentdatabytime")
    @ResponseBody
    public Object commentdatabytime(Date startTime,Date endTime,@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10")int rows){
        try {
            PageInfo<GoodsComment> data= commentService.findGoodsCommentByTime(startTime, endTime,page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception e){
            e.printStackTrace();
            return "{errmsg:"+e.getMessage()+"}";
        }
    }

    @RequestMapping("commentbyid")
    public Object tocommentbyid(int id,ModelMap map){
        GoodsComment comment=commentService.findGoodsCommentById(id);
        map.put("comment",comment);
        return "pinglunbianji";
    }

    @RequestMapping("deletecommentbyid")
    @ResponseBody
    public Object todeletecommentbyid(int id){
        return commentService.deleteGoodsCommentById(id);
    }

    @RequestMapping("insertcommentbyid")
    @ResponseBody
    public Object toinsertcommentbyid(GoodsComment goodsComment){
        return commentService.insertGoodsComment(goodsComment);
    }

    @RequestMapping("updatecommentbyid")
    @ResponseBody
    public Object toupdatecommentbyid(GoodsComment goodsComment){
        return commentService.updateGoodsCommentById(goodsComment);
    }
    @RequestMapping("savecomment")
    @ResponseBody
    public Object savecomment(GoodsComment goodsComment){
        return commentService.updateGoodsCommentById(goodsComment);
    }

    @RequestMapping("insertcomment")
    @ResponseBody
    public Object insertcomment(GoodsComment goodsComment){
        return commentService.insertGoodsComment(goodsComment);
    }
}
