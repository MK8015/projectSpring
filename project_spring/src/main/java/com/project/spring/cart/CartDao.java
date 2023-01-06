package com.project.spring.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public boolean insertProductInCart(String product_id, String member_id) {
		System.out.println("insertProductDao ½ÇÇàµÊ");
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.insert(NAME_SPACE + "insertProductInCart", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
}
