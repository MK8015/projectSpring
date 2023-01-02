package com.project.spring.detail;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ProductVo;

@Repository
public class ProductDao {
	
	private final String NAME_SPACE = "mappers.product.";
	
	@Autowired
	SqlSession sqlSession;
	
	public ProductVo detail(String product_id) {
		return sqlSession.selectOne(NAME_SPACE+"detail",product_id);
	}
}
