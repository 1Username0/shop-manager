package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Advertisement;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.ModelMap;

import java.util.Date;
import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface AdvertisementService {

    List<Advertisement> finAll();

    PageInfo<Advertisement> finAll(int page,int rows);

    Advertisement findAdvertisementByIdService(int id);

    boolean deleteAdvertisementByIdService(int id);

    boolean updateAdvertisementByIdService(Advertisement advertisement);

    boolean insertAdvertisementService(Advertisement advertisement);

    PageInfo<Advertisement> findAdvertisementByProperty(String propertyeName,String propertyvalue,int page,int rows);

    PageInfo<Advertisement> findAdvertisementByTime(Date startTime,Date endTime,int page,int rows);
}
