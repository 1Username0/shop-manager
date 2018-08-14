package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.GoodsCommentDAO;
import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private GoodsCommentDAO goodsCommentDAO;

    @Override
    public List<GoodsComment> findAll() {
        return goodsCommentDAO.findAllComment();
    }

    @Override
    public PageInfo<GoodsComment> finAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsComment> data=findAll();
        PageInfo<GoodsComment> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public GoodsComment findGoodsCommentById(int id) {
        return goodsCommentDAO.findGoodsCommentById(id);
    }

    @Override
    public boolean deleteGoodsCommentById(int id) {
        return goodsCommentDAO.deleteGoodsCommentById(id);
    }

    @Override
    public boolean updateGoodsCommentById(GoodsComment goodsComment) {
        return goodsCommentDAO.updateGoodsCommentById(goodsComment);
    }

    @Override
    public boolean insertGoodsComment(GoodsComment goodsComment) {
        return goodsCommentDAO.insertGoodsComment(goodsComment);
    }

    @Override
    public PageInfo<GoodsComment> findGoodsCommentByProperty(String propertyeName, String propertyvalue, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsComment> data=goodsCommentDAO.findGoodsCommentByProperty(propertyeName,propertyvalue);
        PageInfo<GoodsComment> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public PageInfo<GoodsComment> findGoodsCommentByTime(Date startTime, Date endTime, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsComment> data=goodsCommentDAO.findGoodsCommentoByTime(startTime,endTime);
        PageInfo<GoodsComment> pagevo=new PageInfo(data);
        return pagevo;
    }


}
