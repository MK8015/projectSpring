package com.project.spring.vo;

import lombok.Data;

@Data
public class ProductVo {
	String product_id;
	String product_name;
	String product_image;
	String price;
	String product_quantity;
	String product_category;
	String product_description;
}