package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Memberinfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface MemberInfoService {
    List<Memberinfo> findAll();
    PageInfo<Memberinfo> finAll(int page,int rows);
}
