package com.project.spring.vo;

import lombok.Data;

@Data
public class CartVo {
	private int cart_no;
	private String member_id;
	private String product_id;
	private int cart_amount;
	// ��ٱ��Ͽ��� ��ǰ���� �����÷��� vo�� �׸��߰���
	private String product_name;
	private String product_image;
	private int price;
	private int product_quantity;
	private String product_category;
	private String product_description;
	private String product_author;
	private String product_publisher;
}
 