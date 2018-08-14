package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.GoodsCategoryDAO;
import cn.edu.jxufe.entity.GoodsCategory;
import cn.edu.jxufe.service.GoodsCategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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

    @Override
    public GoodsCategory findGoodsCategoryByIdService(int id) {
        return goodsCategoryDAO.findGoodsCategoryById(id);
    }

    @Override
    public boolean deleteGoodsCategoryByIdService(int id) {
        return goodsCategoryDAO.deleteGoodsCategoryById(id);
    }

    @Override
    public boolean insertGoodsCategoryService(GoodsCategory goodsCategory) {
        return goodsCategoryDAO.insertGoodsCategory(goodsCategory);
    }

    @Override
    public boolean updateGoodsCategoryByIdService(GoodsCategory goodsCategory) {
        return goodsCategoryDAO.updateGoodsCategoryById(goodsCategory);
    }

    @Override
    public PageInfo<GoodsCategory> findGoodsCategoryByProperty(String propertyeName, String propertyvalue, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsCategory> data=goodsCategoryDAO.findGoodsCategoryByProperty(propertyeName,propertyvalue);
        PageInfo<GoodsCategory> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public PageInfo<GoodsCategory> findGoodsCategoryByTime(int startTime, int endTime, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<GoodsCategory> data=goodsCategoryDAO.findGoodsCategoryByTime(startTime, endTime);
        PageInfo<GoodsCategory> pagevo=new PageInfo(data);
        return pagevo;
    }
}
