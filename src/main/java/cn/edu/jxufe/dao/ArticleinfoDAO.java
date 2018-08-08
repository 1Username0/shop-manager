package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Articleinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ArticleinfoDAO继承基类
 */
@Repository
public interface ArticleinfoDAO extends MyBatisBaseDao<Articleinfo, Integer> {
    List<Articleinfo> findAllArticle();
}