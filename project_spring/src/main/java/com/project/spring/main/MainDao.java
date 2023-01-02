package com.project.spring.main;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ProductVo;

@Repository
public class MainDao {
	
	private final String NAME_SPACE = "mappers.main.";
	
	@Autowired
	SqlSession sqlSession;

	
}
