package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.GoodsComment;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface CommentService {

    List<GoodsComment> findAll();

    PageInfo<GoodsComment> finAll(int page,int rows);

    GoodsComment findGoodsCommentById(int id);

    boolean deleteGoodsCommentById(int id);

    boolean updateGoodsCommentById(GoodsComment goodsComment);

    boolean insertGoodsComment(GoodsComment goodsComment);

    PageInfo<GoodsComment> findGoodsCommentByProperty(String propertyeName,String propertyvalue,int page,int rows);

    PageInfo<GoodsComment> findGoodsCommentByTime(Date startTime,Date endTime,int page,int rows);
}
