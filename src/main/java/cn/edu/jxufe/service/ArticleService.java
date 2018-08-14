package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Articleinfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface ArticleService {
    List<Articleinfo> findAll();

    PageInfo<Articleinfo> finAll(int page,int rows);

    Articleinfo findArticleinfoByIdService(int id);

    boolean deleteArticleinfoByIdService(int id);

    boolean insertArticleinfoService(Articleinfo articleinfo);

    boolean updateArticleinfoByIdService(Articleinfo articleinfo);

    PageInfo<Articleinfo> findArticleinfoByProperty(String propertyeName,String propertyvalue,int page,int rows);

    PageInfo<Articleinfo> findArticleinfoByTime(int startTime,int endTime,int page,int rows);
}
