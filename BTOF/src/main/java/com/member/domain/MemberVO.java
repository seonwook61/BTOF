package com.member.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id; 
	private String pw; 
	private String tell; 
	private String nick;
	private String birth;
	private String gend;
	private String rec;
	private Integer wallet; 
	private String user_inter;
	private String user_grade;
	private String user_sales;
	private String power; // 일반회원 "u", 작가"a", 관리자"m"
	private Timestamp updatedate; //가입일은 이 프로젝트에서는 특별히 쓸일없으니까 안만들어도되겠지
	private List<AuthVO> authList;
	
}
