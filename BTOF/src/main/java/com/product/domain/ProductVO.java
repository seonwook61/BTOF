package com.product.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private int r;
	private int prod_no;
	private String prod_name;
	private int prod_div;
	private String prod_descr;
	private String prod_tag;
	private String prod_file;
	private int prod_like;
	private String prod_artist;
	private String prod_pass;
	//private Date prod_regist_day;
	private Date prod_pass_day;
	
	//디테일 b.prod_dtl_serial, b.prod_dtl_own
	private int prod_dtl_no;
	
	private Long prod_dtl_price;
	private String prod_dtl_serial;
	private String prod_dtl_sn;
	private String prod_dtl_own;
	private Integer prod_dtl_bid_price;
	private Integer prod_dtl_best_price;
	private String prod_dtl_bid;
	private Date prod_dtl_startday;
	private Date prod_dtl_lastday;
	private java.sql.Date prod_dtl_registday;
	private String prod_dtl_sales;
	
	
	
}
