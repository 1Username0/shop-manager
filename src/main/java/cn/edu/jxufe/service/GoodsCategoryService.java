package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.GoodsCategory;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface GoodsCategoryService {
    List<GoodsCategory> findAll();

    PageInfo<GoodsCategory> finAll(int page,int rows);

    GoodsCategory findGoodsCategoryByIdService(int id);

    boolean deleteGoodsCategoryByIdService(int id);

    boolean insertGoodsCategoryService(GoodsCategory goodsCategory);

    boolean updateGoodsCategoryByIdService(GoodsCategory goodsCategory);

    PageInfo<GoodsCategory> findGoodsCategoryByProperty(String propertyeName,String propertyvalue,int page,int rows);

    PageInfo<GoodsCategory> findGoodsCategoryByTime(int startTime,int endTime,int page,int rows);
}
