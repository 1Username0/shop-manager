package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.MemberinfoDAO;
import cn.edu.jxufe.entity.Memberinfo;
import cn.edu.jxufe.service.MemberInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
@Service
public class MemberInfoInfoServiceImpl implements MemberInfoService {

    @Autowired
    private MemberinfoDAO memberinfoDAO;

    @Override
    public List<Memberinfo> findAll() {
        return memberinfoDAO.findAllMember();
    }

    @Override
    public PageInfo<Memberinfo> finAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Memberinfo> data=findAll();
        PageInfo<Memberinfo> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public Memberinfo findMemberinfoByIdService(int id) {
        return memberinfoDAO.findMemberinfoById(id);
    }

    @Override
    public boolean deleteMemberinfoByIdService(int id) {
        return memberinfoDAO.deleteMemberinfoById(id);
    }

    @Override
    public boolean insertMemberinfoService(Memberinfo memberinfo) {
        return memberinfoDAO.insertMemberinfo(memberinfo);
    }

    @Override
    public boolean updateMemberinfoByIdService(Memberinfo memberinfo) {
        return memberinfoDAO.updateMemberinfoById(memberinfo);
    }

    @Override
    public PageInfo<Memberinfo> findMemberinfoByProperty(String propertyeName, String propertyvalue, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Memberinfo> data= memberinfoDAO.findMemberinfoByProperty(propertyeName, propertyvalue);
        PageInfo<Memberinfo> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public PageInfo<Memberinfo> findMemberinfoByTime(Date startTime, Date endTime, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Memberinfo> data=memberinfoDAO.findMemberinfoByTime(startTime,endTime);
        PageInfo<Memberinfo> pagevo=new PageInfo(data);
        return pagevo;
    }


}
