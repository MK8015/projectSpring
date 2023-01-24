package com.project.spring.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.MemberVo;
import com.project.spring.vo.OrderVo;

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
	public List<MemberVo> getMemberList(){
		return sqlSession.selectList(NAMESPACE+"getMemberList");
	}
	
	public MemberVo memberDetail(String member_id) {
		return sqlSession.selectOne(NAMESPACE+"memberDetail",member_id);
	}
	
	public boolean updateMember(MemberVo memberVo) {
		int count = sqlSession.update(NAMESPACE+"updateMember",memberVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteMember(String member_id) {
		int count = sqlSession.delete(NAMESPACE+"deleteMember",member_id);
		if(count>0) {
			return true;
		}
		return false;
	}
	public MemberVo getMyInfo(String member_id) {
		MemberVo memberVo=sqlSession.selectOne(NAMESPACE+"getMyInfo",member_id);
		return memberVo;
	}
	public boolean modifyInfo(MemberVo memberVo) {
		
		int result=sqlSession.update(NAMESPACE+"modifyInfo",memberVo);
		if(result>0) {
			return true;
		}
		return false;
	}
	public List<OrderVo> orderList(String member_id) {
		List<OrderVo>list= sqlSession.selectList(NAMESPACE + "orderList",member_id);	
			return list;
		}
	
	public MemberVo naverLoginRun(String naverMember_id) {
		MemberVo memberVo=sqlSession.selectOne(NAMESPACE+"naverLoginRun",naverMember_id);
		return memberVo;
	}
	
}
