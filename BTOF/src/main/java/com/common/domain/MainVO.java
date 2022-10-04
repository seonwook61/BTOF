package com.common.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class MainVO {

	private Integer prod_no; 
	private String prod_name;
	private Integer prod_div;
	private String prod_descr; //PROD_DESCR
	private String prod_tag; //PROD_TAG 
	private String prod_file; //PROD_FILE
	private Integer prod_like; // prod_like
	private String prod_artist; // prod_artist
	private String prod_pass; // prod_pass
	private Date prod_regist_day; // PROD_REGIST_DAY
	private Date prod_pass_day; // PROD_PASS_DAY 
	//private Integer prod_price; //PROD_PRICE
}

//PROD_NO
//PROD_NAME
//PROD_DIV
//PROD_DESCR
//PROD_TAG
//PROD_FILE
//PROD_LIKE
//PROD_ARTIST
//PROD_PASS
//PROD_REGIST_DAY
//PROD_PASS_DAY
//PROD_PRICE
