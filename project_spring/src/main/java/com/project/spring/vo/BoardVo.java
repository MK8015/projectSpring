package com.project.spring.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class BoardVo {
	int bno;
	String title;
	String content;
	String writer;
	Date regdate;
	int viewcnt;
	int re_group;
	int re_seq;
	int re_level;
	int commentcnt;
}
