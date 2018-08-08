package cn.edu.jxufe.service.impl;

import cn.edu.jxufe.dao.AdvertisementDAO;
import cn.edu.jxufe.entity.Advertisement;
import cn.edu.jxufe.service.AdvertisementService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
