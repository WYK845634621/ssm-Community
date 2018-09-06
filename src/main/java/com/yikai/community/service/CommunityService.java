package com.yikai.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yikai.community.bean.Community;
import com.yikai.community.dao.CommunityMapper;
@Service
public class CommunityService {

	@Autowired
	private CommunityMapper communityMapper;
	
	public List<Community> getCommunitys() {
		List<Community> list = communityMapper.selectByExample(null);
		return list;
	}

}
