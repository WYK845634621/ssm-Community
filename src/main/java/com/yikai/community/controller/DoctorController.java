package com.yikai.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yikai.community.bean.Doctor;
import com.yikai.community.bean.Msg;
import com.yikai.community.service.DoctorService;

@Controller
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
//	responseBody正常工作需要导入jackson包
	@RequestMapping("/doctors")
	@ResponseBody 
	public Msg getDoctorsWithJson(@RequestParam(value="pn", defaultValue="1")Integer pn){
//		引入pagehelper分页查询插件,只需要调用PageHelper的方法即可	传入pagenumber和每页显示的数量
		PageHelper.startPage(pn, 10);
		List<Doctor> doctors = doctorService.getAll();
//		将查询结果封装到pageinfo里面，查询时直接将pageinfo交给页面,并设置连续显示的页数
		PageInfo<Doctor> page = new PageInfo<>(doctors, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	
//	@RequestMapping("/doctors")
	public String getDoctors(@RequestParam(value="pn", defaultValue="1")Integer pn, Model model){
//		引入pagehelper分页查询插件,只需要调用PageHelper的方法即可	传入pagenumber和每页显示的数量
		PageHelper .startPage(pn, 10);
		List<Doctor> doctors = doctorService.getAll();
//		将查询结果封装到pageinfo里面，查询时直接将pageinfo交给页面,并设置连续显示的页数
		PageInfo<Doctor> page = new PageInfo<>(doctors, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	
}
