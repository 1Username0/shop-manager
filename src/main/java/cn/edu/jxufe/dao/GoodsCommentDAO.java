package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.entity.Goodsinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * GoodsCommentDAO继承基类
 */
@Repository
public interface GoodsCommentDAO extends MyBatisBaseDao<GoodsComment, Integer> {
    public List<GoodsComment> findAllComment();

    public GoodsComment findGoodsCommentById(int id);

    public boolean deleteGoodsCommentById(int id);

    public boolean insertGoodsComment(GoodsComment goodsComment);

    public boolean updateGoodsCommentById(GoodsComment goodsComment);

    public List<GoodsComment> findGoodsCommentByProperty(@Param("propertyName") String propertyName,@Param("propertyValue") Object propertyValue);

    public List<GoodsComment> findGoodsCommentoByTime(@Param("startTime") Date startTime,@Param("endTime") Date endTime);
}