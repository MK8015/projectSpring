package com.project.spring.vo;

import java.util.List;

import lombok.Data;

@Data
public class CartVo {
	private int cart_no;
	private String member_id;
	private String product_id;
	private int cart_amount;
	// 장바구니에서 상품정보 빼내올려고 vo에 항목추가함
	private String product_name;
	private String product_image;
	private int price;
	private String product_author;
	private String product_publisher;
	
	private List<CartVo> cartList;
}
 