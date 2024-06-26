package com.project.spring.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class OrderVo {
	private int order_no;
	private String member_id;
	private String product_id;  
	private int order_amount; 
	private String order_address; 
	private String order_address_detail;
	private String order_phonenum; 
	private Date order_date; 
	private String product_name;
	private String product_image;
	private int price;
	private int quantity;
	private String product_author;
	private String product_publisher;
	private String member_name;

}
