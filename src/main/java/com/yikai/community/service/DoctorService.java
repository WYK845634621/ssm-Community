package com.yikai.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.community.bean.Doctor;
import com.yikai.community.bean.DoctorExample;
import com.yikai.community.bean.DoctorExample.Criteria;
import com.yikai.community.dao.DoctorMapper;
@Service
public class DoctorService {
	
	@Autowired
	DoctorMapper doctorMapper;
	
	

	public List<Doctor> getAll() {
		return doctorMapper.selectByExampleWithCmy(null);
	}


//	保存doctor
	public void saveDoctor(Doctor doctor) {
		doctorMapper.insertSelective(doctor);
		
	}


//检验doctor名字是否已存在
	public boolean checkUser(String doctorName) {
		DoctorExample example = new DoctorExample();
		Criteria criteria = example.createCriteria();
		criteria.andDoctorNameEqualTo(doctorName);
		long count = doctorMapper.countByExample(example);
		return count == 0;
	}

	
	
	
}
