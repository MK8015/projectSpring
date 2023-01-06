package com.project.spring.vo;

import lombok.Data;

@Data
public class CartVo {
	private int cart_no;
	private String member_id;
	private String product_id;
	private int cart_amount;
	
}
