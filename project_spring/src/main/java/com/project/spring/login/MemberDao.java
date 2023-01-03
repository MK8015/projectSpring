package com.project.spring.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
