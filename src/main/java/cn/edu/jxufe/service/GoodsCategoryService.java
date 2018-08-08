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
}
