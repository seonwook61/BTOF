package com.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private int prod_no;
	private String prod_name;
	private int prod_div;
	private String prod_descr;
	private String prod_tag;
	private String prod_file;
	private int prod_like;
	private String prod_artist;
	private String prod_pass;
	private Date prod_regist_day;
	private Date prod_pass_day;
	private long prod_price;
	
	//디테일 b.prod_dtl_serial, b.prod_dtl_own
	private Long prod_dtl_price;
	private String prod_dtl_serial;
	private String prod_dtl_sn;
	private String prod_dtl_own;
	
	
	
}
