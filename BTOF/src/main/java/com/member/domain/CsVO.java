package com.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CsVO {
	private int bno;
	private String title;
	private String writer;
	private Timestamp date;
	private String content;
	private String answer;
	private String priority;
	
}
