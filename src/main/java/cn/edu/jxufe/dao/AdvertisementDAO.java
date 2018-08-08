package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Advertisement;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * AdvertisementDAO继承基类
 */
@Repository
public interface AdvertisementDAO extends MyBatisBaseDao<Advertisement, Integer> {
    public List<Advertisement> findAllAdvertisement();
}