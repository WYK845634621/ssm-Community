package com.yikai.community.bean;

public class Doctor {
    private Integer doctorId;

    private String doctorName;

    private String gender;

    private Integer age;

    private String phone;

    private String email;

    private String address;

    private String idcard;

    private Integer cId;

    private Integer sId;
    
//    自定义community属性
    private Community community;
    

    public Doctor() {
	super();
}

	public Doctor(Integer doctorId, String doctorName, String gender, Integer age, String phone, String email,
		String address, String idcard, Integer cId, Integer sId) {
	super();
	this.doctorId = doctorId;
	this.doctorName = doctorName;
	this.gender = gender;
	this.age = age;
	this.phone = phone;
	this.email = email;
	this.address = address;
	this.idcard = idcard;
	this.cId = cId;
	this.sId = sId;
}

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}

	public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName == null ? null : doctorName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }
}