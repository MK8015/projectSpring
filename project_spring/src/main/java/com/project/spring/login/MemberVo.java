package com.project.spring.login;

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
}
