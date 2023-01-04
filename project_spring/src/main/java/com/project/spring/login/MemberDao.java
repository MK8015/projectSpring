package com.project.spring.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		System.out.println("dao member_id:"+memeber_id);
		System.out.println("dao password:"+password);
		map.put("member_id", memeber_id);
		map.put("password", password);
		System.out.println("map:"+map);
		MemberVo memberVo= sqlSession.selectOne(NAMESPACE+"loginRun",map);
		System.out.println("dao memberVo"+memberVo);
		return memberVo;
	}
}
