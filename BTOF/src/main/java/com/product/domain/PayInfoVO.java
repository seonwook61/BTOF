package com.product.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayInfoVO {
	private String imp_uid;
	private String merchant_uid;
	private String pay_method;
	private int paid_amount; //prod_dtl_price
	private String name; // 작품명
	private String pg_provider;
	private String buyer_name; // id 
	private String buyer_email; 
	private int buyer_tel; // prod_dtl_no
	private String buyer_addr; 
	private String buyer_postcode;
	private Timestamp paid_at; // 필요없음
	private String reveipt_url; 
	private String seller;
}