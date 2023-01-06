package com.project.spring.cart;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.CartVo;
import com.project.spring.vo.ProductVo;

@Service
public class CartService {
	
	@Autowired
	CartDao cartDao;
	
	public List<CartVo> getCartList() {
		return cartDao.getCartList();
	}
	
	public boolean insertProductInCart(String product_id, String member_id) {
		System.out.println("insertProductService ½ÇÇàµÊ");
		return cartDao.insertProductInCart(product_id, member_id);
	}
}
