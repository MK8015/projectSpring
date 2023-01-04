package com.project.spring.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;
@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	public boolean registerRun(MemberVo memberVo) {
	 	return memberDao.registerRun(memberVo);
		
	}
	public boolean idCheck(String member_id) {
		return memberDao.idCheck(member_id);
	}
	public MemberVo loginRun(String memeber_id,String password) {
		System.out.println("service member_id"+memeber_id);
		System.out.println("service password"+password);
		MemberVo memberVo= memberDao.loginRun(memeber_id,memeber_id);
		return memberVo;
	}
}
