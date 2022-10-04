package com.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PreArtistVO {
	Integer bno;
	String id;
	String artist_name;
	String artist_id_photo;
	String pofol_url;
	String self_introd;
	Date submit_date;
}

