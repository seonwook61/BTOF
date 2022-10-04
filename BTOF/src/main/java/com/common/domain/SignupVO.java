package com.common.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class SignupVO {
	private String id;
	private String pw;
	private String tel;
	private String nick;
	private String birth;
	private String nick2;
	private Timestamp regdate;
}