package com.artist.domain;

import java.util.Date;


import lombok.Data;

@Data
public class ArtistVO {

	
	private String artist_name;
	private String artist_nick;
	private String artist_id;
	private String artist_url;
	private String artist_introd;
	private String artist_pass;
	private Date artist_regist_date;
	private Date artist_pass_date;
	private int artist_total_wish;
	
	private int prod_no;
	private String prod_name;
	private int prod_div;
	private String prod_descr;
	private String prod_tag;
	private String prod_file;
	private int prod_like;
	private String prod_artist;
	private String prod_pass;
	private Date prod_regsit_day;
	private Date prod_pass_day;
}
