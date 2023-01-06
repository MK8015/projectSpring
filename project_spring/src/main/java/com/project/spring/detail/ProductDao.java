package com.project.spring.detail;

import java.util.List;

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
	
	public List<ProductVo> getList(){
		return sqlSession.selectList(NAME_SPACE+"select");
	}
	public int insert(ProductVo productVo) {
		return sqlSession.insert(NAME_SPACE+productVo);
	}
	public int delete(String product_id) {
		return sqlSession.delete(NAME_SPACE+product_id);
	}
	public int update(ProductVo productVo) {
		return sqlSession.update(NAME_SPACE+productVo);
	}
}
