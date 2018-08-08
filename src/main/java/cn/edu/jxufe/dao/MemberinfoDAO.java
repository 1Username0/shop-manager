package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.Memberinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * MemberinfoDAO继承基类
 */
@Repository
public interface MemberinfoDAO extends MyBatisBaseDao<Memberinfo, Integer> {
    List<Memberinfo> findAllMember();
}