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

//	查询
	public Doctor getDoctor(Integer id) {
		Doctor doctor = doctorMapper.selectByPrimaryKey(id);
		return doctor;
	}

//	更新
	public void updateDoctor(Doctor doctor) {
		doctorMapper.updateByPrimaryKeySelective(doctor);
	}

//	删除
	public void deleteDoctor(Integer id) {
		doctorMapper.deleteByPrimaryKey(id);
		
	}


	public void deleteBatch(List<Integer> ids) {
		DoctorExample example = new DoctorExample();
		Criteria criteria = example.createCriteria();
		criteria.andDoctorIdIn(ids);
		doctorMapper.deleteByExample(example);
	}

	
	
	
}
