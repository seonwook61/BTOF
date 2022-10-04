package com.product.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class SellStatusVO {
	private String id;
	private int prod_dtl_no;
	private String prod_name;
	private String prod_artist;
	private String prod_div;
	private String prod_dtl_sn;
	private int piece;
	private String checkType;
	private int prod_dtl_price;
	private String seller;
	private String prod_dtl_owner;
	private String prod_dtl_bid;
	private int prod_dtl_bid_price;
	private Date prod_dtl_startday;
	private Date prod_dtl_endday;
	private String prod_dtl_sales;
	private Date prod_dtl_registday;
	private String prod_dtl_name;
	private String prod_dtl_artist;
	private int r;
	
}
