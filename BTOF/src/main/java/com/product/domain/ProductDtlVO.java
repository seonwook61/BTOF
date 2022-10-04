package com.product.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDtlVO {
	private int prod_dtl_no;
	private String prod_dtl_serial;
	private int prod_dtl_sn;
	private String prod_dtl_own;
	private Long prod_dtl_price;
	private Long prod_dtl_bid_price;
	private Long prod_dtl_bid_best_price;
	private char prod_dtl_bid;
	private Date prod_dtl_startday;
	private Date prod_dtl_lastday;
	private char prod_dtl_sales;
	
	
}


