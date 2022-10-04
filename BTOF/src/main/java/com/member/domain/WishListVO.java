package com.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WishListVO {
	
	private int prod_no;
	private String id;
	private int likes;
	
	
	private String prod_name;
	private int prod_div;
	private String prod_descr;
	private String prod_tag;
	private String prod_file;
	private int prod_likes;
	private String prod_artist;
	private String prod_pass;
	private Date prod_regist_day;
	private Date prod_pass_day;
	private int prod_price;
	
	
}
