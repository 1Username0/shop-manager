package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Advertisement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * AdvertisementDAO继承基类
 */
@Repository
public interface AdvertisementDAO extends MyBatisBaseDao<Advertisement, Integer> {
    public List<Advertisement> findAllAdvertisement();

    public Advertisement findAdvertisementById(int id);

    public boolean deleteAdvertisementById(int id);

    public boolean updateAdvertisementById(Advertisement advertisement);

    public boolean insertAdvertisement(Advertisement advertisement);

    public List<Advertisement> findAdvertisementByProperty(@Param("propertyName") String propertyName,@Param("propertyValue") Object propertyValue);

    public List<Advertisement> findAdvertisementByTime(@Param("startTime") Date startTime,@Param("endTime") Date endTime);
}