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
}
