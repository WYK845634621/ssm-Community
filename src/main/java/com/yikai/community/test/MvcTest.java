package com.yikai.community.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.yikai.community.bean.Doctor;
//servlet4测试的时候需要servlet3.0的支持
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
	
//	传入springmvc的ioc
	@Autowired
	WebApplicationContext context;
	
//	使用spring测试单元测试mvc功能实现，虚拟的mvc请求
	MockMvc mockMvc;
	
//	junit的before
	@Before
	public void initMockMvc(){
		
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	
	@Test
	public void testPageHelper() throws Exception{
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/doctors").param("pn", "3")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码：" + pi.getPageNum());
		System.out.println("总页码数:" + pi.getPages());
		System.out.println("总记录数:" + pi.getTotal());
		System.out.println("在页面需要连续显示的页码");
		int[] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}
		
//		获取员工数据
		List<Doctor> list = pi.getList();
		for (Doctor doctor : list) {
			System.out.println("id:" + doctor.getDoctorId() + "==>姓名:" + doctor.getDoctorName());
		}
		
	}
	

}
