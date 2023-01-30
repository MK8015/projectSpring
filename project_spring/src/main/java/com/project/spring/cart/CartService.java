package com.project.spring.cart;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.CartVo;

@Service
public class CartService {
	
	@Autowired
	CartDao cartDao;
	
	public List<CartVo> getCartList(String member_id) {
		return cartDao.getCartList(member_id);
	}
	
	public boolean insertProductInCart(String product_id, String member_id) {

		return cartDao.insertProductInCart(product_id, member_id);
	}
	
	public boolean deleteCart(String[] arr_product_id, String member_id) {
		return cartDao.deleteCart(arr_product_id, member_id);
	}
	
	public boolean updateCart(int cart_amount, String product_id, String member_id) {
		return cartDao.updateCart(cart_amount, product_id, member_id);
	}

	// cartno별 cartVo구하기
	public CartVo getCartListByNo(int cart_no) {
		return cartDao.getCartListByNo(cart_no);
	}

	public int memberCartCount(String member_id) {
		return cartDao.memberCartCount(member_id);
	}
  
  // detail 에서 카트 추가
	public boolean insertCart(String product_id, String member_id, String cart_amount) {
		return cartDao.insertCart(product_id,member_id,cart_amount);
	}
	
	public int isAlreadyCart(String product_id,String member_id){
		return cartDao.isAlreadyCart(product_id,member_id);
	}
	
	
}
