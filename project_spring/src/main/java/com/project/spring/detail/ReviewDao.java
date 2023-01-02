package com.project.spring.detail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	private final String NAME_SPACE = "mappers.review.";
	
	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVo> getList(String product_id) {
		return sqlSession.selectList(NAME_SPACE+"getList",product_id);
	}
}
