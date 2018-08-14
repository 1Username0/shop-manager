package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Memberinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.security.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * MemberinfoDAO继承基类
 */
@Repository
public interface MemberinfoDAO extends MyBatisBaseDao<Memberinfo, Integer> {
    public List<Memberinfo> findAllMember();

    public Memberinfo findMemberinfoById(int id);

    public boolean deleteMemberinfoById(int id);

    public boolean insertMemberinfo(Memberinfo memberinfo);

    public boolean updateMemberinfoById(Memberinfo memberinfo);

    /**
     *  根据自定义的属性来查询
     * @param propertyName  属性名字
     * @param propertyValue 属性对应的值
     * @return
     */
    public List<Memberinfo> findMemberinfoByProperty(@Param("propertyName") String propertyName,@Param("propertyValue") Object propertyValue);

    public List<Memberinfo> findMemberinfoByTime(@Param("startTime") Date startTime,@Param("endTime") Date endTime);


}