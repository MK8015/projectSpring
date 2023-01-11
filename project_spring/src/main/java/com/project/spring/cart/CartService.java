package com.project.spring.cart;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
//		System.out.println("insertProductService �����");
		return cartDao.insertProductInCart(product_id, member_id);
	}
	
	public boolean deleteCart(String[] arr_product_id, String member_id) {
		return cartDao.deleteCart(arr_product_id, member_id);
	}
	
	public boolean updateCart(int cart_amount, String product_id, String member_id) {
		return cartDao.updateCart(cart_amount, product_id, member_id);
	}
	
	public boolean insertCart(String product_id, String member_id, String cart_amount) {
		return cartDao.insertCart(product_id,member_id,cart_amount);
	}
}
