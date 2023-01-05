package com.project.spring.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.CartVo;


@Repository
public class CartDao {
	
	private final String NAME_SPACE = "mappers.cart.";
	
	@Autowired
	SqlSession sqlSession;
	public List<CartVo> getCartList() {
		return sqlSession.selectList(NAME_SPACE + "getCartList");
	}
	
}
