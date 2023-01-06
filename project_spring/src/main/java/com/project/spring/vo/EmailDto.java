package com.project.spring.vo;

import lombok.Data;

@Data
public class EmailDto {
	private String member_id;
	private String from="springprojectkh@gmail.com";
	private String to;
	private String subject;
	private String content;
}
