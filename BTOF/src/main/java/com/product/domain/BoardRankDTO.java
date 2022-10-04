package com.product.domain;

import java.util.Date;

import lombok.Data;

/*
	create SQL board
	작가명
	작가소개
	작가이미지파일
	작품파일
	작품명
	작품소개
	하트수
	신청일
 */

@Data
public class BoardRankDTO {

	private String artist_name;
	private String artist_intrud;
	private String artist_image;
	private String prod_file;
	private String prod_name;
	private String prod_desc;
	private int prod_like;
	private Date prod_pass_day;
	
	
	
}
