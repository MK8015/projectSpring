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
	
	public List<CartVo> getCartList(String member_id) {
		return sqlSession.selectList(NAME_SPACE + "getCartList", member_id);
	}
	
	// 카트 상품 등록
	public boolean insertProductInCart(String product_id, String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.insert(NAME_SPACE + "insertProductInCart", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 카트 삭제
	public boolean deleteCart(String[] arr_product_id, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("arr_product_id", arr_product_id);
		map.put("member_id", member_id);
		int count = sqlSession.delete(NAME_SPACE + "deleteCart", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 카트 수정
	public boolean updateCart(int cart_amount, String product_id, String member_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("cart_amount", cart_amount);
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.update(NAME_SPACE + "updateCart", map); 
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	// 카트넘버별 cartVo 조회
	public CartVo getCartListByNo(int cart_no) {
		return sqlSession.selectOne(NAME_SPACE + "getCartListByNo", cart_no);
	}
	
	public int memberCartCount(String member_id) {
		return sqlSession.selectOne(NAME_SPACE + "memberCartCount", member_id);
	}
  
	// detail 에서 카트 추가
	public boolean insertCart(String product_id, String member_id, String cart_amount) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		map.put("cart_amount", cart_amount);
		int count = sqlSession.insert(NAME_SPACE + "insertCart", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	public int isAlreadyCart(String product_id,String member_id){
		Map<String, String>map=new HashMap<>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count=sqlSession.selectOne(NAME_SPACE+"isAlreadyCart",map);
		
		return count;
	}
}
