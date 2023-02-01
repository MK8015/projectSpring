package com.project.spring.detail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.OrderVo;
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
		return sqlSession.selectList(NAME_SPACE+"getList");
	}
	
	public boolean insert(ProductVo productVo) {
		int count = sqlSession.insert(NAME_SPACE+"insert",productVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public boolean delete(String product_id) {
		int count = sqlSession.delete(NAME_SPACE+"delete",product_id);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public boolean update(ProductVo productVo) {
		int count = sqlSession.update(NAME_SPACE+"update",productVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	// 재고 차감
	public boolean subInventory(OrderVo orderVo) {
		int count = sqlSession.update(NAME_SPACE + "subInventory", orderVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
}
