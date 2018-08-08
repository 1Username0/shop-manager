package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.GoodsComment;
import cn.edu.jxufe.entity.Goodsinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * GoodsCommentDAO继承基类
 */
@Repository
public interface GoodsCommentDAO extends MyBatisBaseDao<GoodsComment, Integer> {
    List<GoodsComment> findAllComment();
}