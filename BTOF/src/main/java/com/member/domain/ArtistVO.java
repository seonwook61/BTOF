package com.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ArtistVO {
	private String artist_name; // 아이디
	private String artist_nick; // 작가 활동명 
	private String artist_id;
	private String artist_url;
	private String artist_introd;
	//private String artist_pass;
	private Date artist_regist_day;
	//private Date artist_pass_day;
	//private int artist_total_wish;
}
