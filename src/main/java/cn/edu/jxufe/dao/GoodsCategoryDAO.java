package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.GoodsCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * GoodsCategoryDAO继承基类
 */
@Repository
public interface GoodsCategoryDAO extends MyBatisBaseDao<GoodsCategory, Integer> {
    public List<GoodsCategory> findAllGoodsCategory();

    public GoodsCategory findGoodsCategoryById(int id);

    public boolean deleteGoodsCategoryById(int id);

    public boolean insertGoodsCategory(GoodsCategory goodsCategory);

    public boolean updateGoodsCategoryById(GoodsCategory goodsCategory);

    public List<GoodsCategory> findGoodsCategoryByProperty(@Param("propertyName") String propertyName,@Param("propertyValue") Object propertyValue);

    public List<GoodsCategory> findGoodsCategoryByTime(@Param("startTime") int startTime,@Param("endTime") int endTime);
}