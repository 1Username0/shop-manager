package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Memberinfo;
import com.github.pagehelper.PageInfo;

import java.security.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface MemberInfoService {
    List<Memberinfo> findAll();

    PageInfo<Memberinfo> finAll(int page,int rows);

    Memberinfo findMemberinfoByIdService(int id);

    boolean deleteMemberinfoByIdService(int id);

    boolean insertMemberinfoService(Memberinfo memberinfo);

    boolean updateMemberinfoByIdService(Memberinfo memberinfo);

    PageInfo<Memberinfo> findMemberinfoByProperty(String propertyeName,String propertyvalue,int page,int rows);

    PageInfo<Memberinfo> findMemberinfoByTime(Date startTime,Date endTime,int page,int rows);
}
