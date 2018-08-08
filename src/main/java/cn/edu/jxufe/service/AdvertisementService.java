package cn.edu.jxufe.service;

import cn.edu.jxufe.entity.Advertisement;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by m1777 on 2018/8/8.
 */
public interface AdvertisementService {

    List<Advertisement> finAll();

    PageInfo<Advertisement> finAll(int page,int rows);
}
