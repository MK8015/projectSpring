package com.project.spring.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class OrderVo {
	
	private int ORDER_NO;
	private String MEMBER_ID;
	private String PRODUCT_ID;  
	private int ORDER_AMOUNT; 
	private String ORDER_ADDRESS; 
	private int ORDER_PHONENUM; 
	private Date ORDER_DATE; 
	private String PRODUCT_NAME;
	private String PRODUCT_IMAGE;
	private int PRICE;
	private int QUANTITY;
	private String PRODUCT_AUTHOR;
	private String PRODUCT_PUBLISHER;

}
