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
//		System.out.println("insertProductService ½ÇÇàµÊ");
		return cartDao.insertProductInCart(product_id, member_id);
	}
	
	public boolean deleteCart(String[] arr_product_id, String member_id) {
		return cartDao.deleteCart(arr_product_id, member_id);
	}
	
	public boolean updateCart(int cart_amount, String product_id) {
		return cartDao.updateCart(cart_amount, product_id);
	}
}
