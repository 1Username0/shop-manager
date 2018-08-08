package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.GoodsCommentDAO;
import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
