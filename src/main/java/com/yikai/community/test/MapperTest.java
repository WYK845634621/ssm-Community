package com.yikai.community.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yikai.community.bean.Community;
import com.yikai.community.bean.Doctor;
import com.yikai.community.dao.CommunityMapper;
import com.yikai.community.dao.DoctorMapper;

/**
 *  1.导入spring-test单元测试; 2.指定spring的配置文件的位置; 3.直接@autowired即可
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	
	@Autowired
	CommunityMapper communityMapper;
	@Autowired
	DoctorMapper doctorMapper;
	@Autowired
	SqlSession sqlSession;
	
	
	/**
	 * 测试Community
	 */
	@Test
	public void test() {
		
		System.out.println(communityMapper);
		
//		插入社区测试
//		communityMapper.insertSelective(new Community(null, "开源社区"));
//		communityMapper.insertSelective(new Community(null, "apple社区"));
		
		
//		插入医生测试
//		doctorMapper.insertSelective(new Doctor(null, "范翠静", "F", 20, "15536836754", "845634621@qq.com", "浙江省杭州市阳光新区", "140651548152125431", 2, 1002));
		
//		批量插入多条信息，除了使用for循环以外，可以使用批量专属的sqlSession
		DoctorMapper mapper = sqlSession.getMapper(DoctorMapper.class);
		for(int i = 0; i < 100; i++){
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Doctor(null, uid, "F", 18, "10000000001", uid + "@163.com", "湖南省长沙市柳州新区"+56+i+"号公寓", "", 1, 1002+i));
		}
		System.out.println("批量完成任务");
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
