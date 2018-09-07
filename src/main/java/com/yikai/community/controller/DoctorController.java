package com.yikai.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
//	添加doctor保存   	
	@RequestMapping(value="/doctor", method=RequestMethod.POST)
	@ResponseBody
	public Msg saveDoctor(@Valid Doctor doctor, BindingResult result){
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名: " + fieldError.getField());
				System.out.println("错误的信息: " + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			doctorService.saveDoctor(doctor);
			return Msg.success();
		}
	}
	
//	检查用户名是否重复，返回true即代表可用
	@ResponseBody
	@RequestMapping("/checkuse")
	public Msg checkuse(@RequestParam("doctorName") String doctorName){
//		先判断用户名是否合法
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,4})$";
		if (!doctorName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16字母数字组合或者2-4个汉字");
		}
		boolean b = doctorService.checkUser(doctorName);
		if (b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名必须是6-16字母数字组合或者2-4个汉字");
		}
	}
	
	
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
