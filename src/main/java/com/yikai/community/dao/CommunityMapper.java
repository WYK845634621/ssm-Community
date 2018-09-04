package com.yikai.community.dao;

import com.yikai.community.bean.Community;
import com.yikai.community.bean.CommunityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommunityMapper {
    long countByExample(CommunityExample example);

    int deleteByExample(CommunityExample example);

    int deleteByPrimaryKey(Integer cmyId);

    int insert(Community record);

    int insertSelective(Community record);

    List<Community> selectByExample(CommunityExample example);

    Community selectByPrimaryKey(Integer cmyId);

    int updateByExampleSelective(@Param("record") Community record, @Param("example") CommunityExample example);

    int updateByExample(@Param("record") Community record, @Param("example") CommunityExample example);

    int updateByPrimaryKeySelective(Community record);

    int updateByPrimaryKey(Community record);
}