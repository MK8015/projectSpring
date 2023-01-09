package com.project.spring.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVo {
	String member_id; 
	String password;
	String member_name; 
	int phonenum;
	String email;
	String address; 
	Date regdate;
	String member_pic;
	String address_detail;
	
}
