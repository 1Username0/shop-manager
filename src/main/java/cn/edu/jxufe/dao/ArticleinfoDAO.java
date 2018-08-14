package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Articleinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ArticleinfoDAO继承基类
 */
@Repository
public interface ArticleinfoDAO extends MyBatisBaseDao<Articleinfo, Integer> {
    public List<Articleinfo> findAllArticle();

    public Articleinfo findArticleinfoById(int id);

    public boolean deleteArticleinfoById(int id);

    public boolean insertArticleinfo(Articleinfo articleinfo);

    public boolean updateArticleinfoById(Articleinfo articleinfo);

    public List<Articleinfo> findArticleinfooByProperty(@Param("propertyName") String propertyName,@Param("propertyValue") Object propertyValue);

    public List<Articleinfo> findArticleinfoByTime(@Param("startTime") int startTime,@Param("endTime") int endTime);
}