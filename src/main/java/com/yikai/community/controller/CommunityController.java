package com.yikai.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yikai.community.bean.Community;
import com.yikai.community.bean.Msg;
import com.yikai.community.service.CommunityService;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	//返回所有部门列表
	@RequestMapping("/communitys")
	@ResponseBody
	public Msg getCommunitys(){
		List<Community> list =  communityService.getCommunitys();
		return Msg.success().add("communitys", list);
	}
	
}
