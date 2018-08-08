package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.GoodsComment;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface CommentService {

    List<GoodsComment> findAll();
    PageInfo<GoodsComment> finAll(int page,int rows);
}
