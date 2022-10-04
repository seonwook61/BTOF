package com.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PdVO {
	//
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
	//
	private int p_pno;
	private String serialNo;
	private String owner;
	private int price;
	private int topPrice; //이건 없어도 되는거같아 매번들어오는 수를 체크해서 크면 바로 price에 넣어주니까
	private int p_likecnt;
	private String bidding;
	
}
