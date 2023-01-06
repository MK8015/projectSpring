package com.project.spring.cart;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.CartVo;

@Service
public class CartService {
	
	@Autowired
	CartDao cartDao;
	
	public List<CartVo> getCartList() {
		return cartDao.getCartList();
	}
}
