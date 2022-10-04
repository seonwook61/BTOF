package com.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PVO {
	private int pno;
	private String title;
	private int div;
	private String ctgr;
	private String thumb;
	private String what;
	private String tags;
	private int likecnt;
	private String artist;
	private Timestamp submitdate;
	private String passox;
	private Timestamp passdate;
	
}
