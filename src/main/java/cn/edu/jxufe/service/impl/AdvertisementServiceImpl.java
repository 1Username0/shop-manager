package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.AdvertisementDAO;
import cn.edu.jxufe.entity.Advertisement;
import cn.edu.jxufe.service.AdvertisementService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
@Service
public class AdvertisementServiceImpl implements AdvertisementService{
    @Autowired
    private AdvertisementDAO advertisementDAO;

    @Override
    public List<Advertisement> finAll() {
        return advertisementDAO.findAllAdvertisement();
    }

    @Override
    public PageInfo<Advertisement> finAll(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<Advertisement> data=finAll();
        PageInfo<Advertisement> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public Advertisement findAdvertisementByIdService(int id) {
        return advertisementDAO.findAdvertisementById(id);
    }

    @Override
    public boolean deleteAdvertisementByIdService(int id) {
        return advertisementDAO.deleteAdvertisementById(id);
    }

    @Override
    public boolean updateAdvertisementByIdService(Advertisement advertisement) {
        return advertisementDAO.updateAdvertisementById(advertisement);
    }

    @Override
    public boolean insertAdvertisementService(Advertisement advertisement) {
        return advertisementDAO.insertAdvertisement(advertisement);
    }

    @Override
    public PageInfo<Advertisement> findAdvertisementByProperty(String propertyeName, String propertyvalue, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<Advertisement> data= advertisementDAO.findAdvertisementByProperty(propertyeName,propertyvalue);
        PageInfo<Advertisement> pagevo=new PageInfo(data);
        return pagevo;
    }

    @Override
    public PageInfo<Advertisement> findAdvertisementByTime(Date startTime, Date endTime, int page, int rows) {
        PageHelper.startPage(page,rows);
        List<Advertisement> data= advertisementDAO.findAdvertisementByTime(startTime,endTime);
        PageInfo<Advertisement> pagevo=new PageInfo(data);
        return pagevo;
    }
}
