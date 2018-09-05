package com.yikai.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yikai.community.bean.Doctor;
import com.yikai.community.dao.DoctorMapper;
@Service
public class DoctorService {
	
	@Autowired
	DoctorMapper doctorMapper;
	
	

	public List<Doctor> getAll() {
		return doctorMapper.selectByExampleWithCmy(null);
	}

	
	
	
}
