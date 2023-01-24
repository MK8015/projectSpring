package com.project.spring.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ProductVo;

@Repository
public class MainDao {
	
	private final String NAME_SPACE = "mappers.main.";
	
	@Autowired
	SqlSession sqlSession;

	public List<ProductVo> getList() {
		List<ProductVo> list = sqlSession.selectList(NAME_SPACE + "list");
		return list;
	}

	public List<ProductVo> getListlike(String member_id) {
		List<ProductVo> listlike = sqlSession.selectList(NAME_SPACE + "getListlike",member_id);
		return listlike;
	}
	
}
