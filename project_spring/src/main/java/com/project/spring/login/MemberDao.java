package com.project.spring.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.EmailDto;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;

@Repository
public class MemberDao {
	
	private final String NAMESPACE = "mappers.member.";
	
	@Autowired
	SqlSession sqlSession;
	
	public boolean registerRun(MemberVo memberVo) {
	int count=sqlSession.insert(NAMESPACE+"registerRun",memberVo);
	if(count>0) {
		return true;
		}
	return false;
	}
	
	public boolean idCheck(String member_id) {
		int count= sqlSession.selectOne(NAMESPACE+"idCheck",member_id);		
		if(count>0) {
			return true;
		}
		return false; 
	}
	
	public MemberVo loginRun(String memeber_id,String password) {
		Map<String, String>map=new HashMap<>();
		map.put("member_id", memeber_id);
		map.put("password", password);
		MemberVo memberVo= sqlSession.selectOne(NAMESPACE+"loginRun",map);
		return memberVo;
	}
	
	public boolean isExist(String member_id,String email) {
		Map<String,String>map=new HashMap<>();
		map.put("member_id",member_id);
		map.put("email", email);
		int count=sqlSession.selectOne(NAMESPACE+"isExist",map);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public boolean updatePassword(String email,String newPassword) {
		Map<String, String>map=new HashMap<>();
		map.put("email", email);
		map.put("password", newPassword);
		int count= sqlSession.update(NAMESPACE+"updatePassword",map);
		if(count>0) {
			return true;
		}
		return false;
	}
	
}
