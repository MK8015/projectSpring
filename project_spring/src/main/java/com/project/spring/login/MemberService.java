package com.project.spring.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;
@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	public boolean registerRun(MemberVo memberVo) {
	 	return memberDao.registerRun(memberVo);
		
	}
	
}
