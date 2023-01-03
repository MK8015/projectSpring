package com.project.spring.vo;

import lombok.Data;

@Data
public class ReviewVo {
	String review_no;
	String member_id;
	String product_id;
	String review_rating;
	String review_title;
	String review_content;
	String review_image;
	String review_date;
	String member_pic;
}
