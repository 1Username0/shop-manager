package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.ArticleinfoDAO;
import cn.edu.jxufe.entity.Articleinfo;
import cn.edu.jxufe.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    private ArticleinfoDAO articleinfoDAO;

    @Override
    public List<Articleinfo> findAll() {
        return articleinfoDAO.findAllArticle();
    }

    @Override
    public PageInfo<Articleinfo> finAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Articleinfo> data=findAll();
        PageInfo<Articleinfo> pagevo=new PageInfo(data);
        return pagevo;
    }
}
