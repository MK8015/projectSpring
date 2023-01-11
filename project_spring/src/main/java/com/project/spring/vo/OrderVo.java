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
	private String address_detail;
	private int order_phonenum; 
	private Date order_date; 
	private String product_name;
	private String product_image;
	private int price;
	private int quantity;
	private String product_author;
	private String product_publisher;

}
