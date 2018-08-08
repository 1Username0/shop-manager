package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.GoodsCategoryDAO;
import cn.edu.jxufe.entity.GoodsCategory;
import cn.edu.jxufe.service.GoodsCategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.websocket.server.ServerEndpoint;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService{

    @Autowired
    private GoodsCategoryDAO goodsCategoryDAO;
    @Override
    public List<GoodsCategory> findAll() {
        return goodsCategoryDAO.findAllGoodsCategory();
    }

    @Override
    public PageInfo<GoodsCategory> finAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsCategory> data=findAll();
        PageInfo<GoodsCategory> pagevo=new PageInfo(data);
        return pagevo;
    }
}
