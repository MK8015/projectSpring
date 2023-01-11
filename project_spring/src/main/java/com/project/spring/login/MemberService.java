package com.project.spring.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.EmailDto;
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
		MemberVo memberVo= memberDao.loginRun(memeber_id,password);
		return memberVo;
	}
	
	public boolean isExist(String member_id, String email) {
		boolean result=memberDao.isExist(member_id,email);
		return result;
	}
	
	public boolean updatePassword(String email,String newPassword) {
		boolean result= memberDao.updatePassword(email, newPassword);
		return result;
	}
	
	public List<MemberVo> getMemberList(){
		return memberDao.getMemberList();
	}
	
	public MemberVo memberDetail(String member_id) {
		return memberDao.memberDetail(member_id);
	}
	
	public boolean updateMember(MemberVo memberVo) {
		return memberDao.updateMember(memberVo);
	}
	
	public boolean deleteMember(String member_id) {
		return memberDao.deleteMember(member_id);
	}
	
	public MemberVo getMyInfo(String member_id) {
		return memberDao.getMyInfo(member_id);
	}
	
	public boolean modifyInfo(MemberVo memberVo) {
		return memberDao.modifyInfo(memberVo);
	}
	 
}
