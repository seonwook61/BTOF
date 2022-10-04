package com.board.domain;

import lombok.Data;

@Data
public class InquiryVO {
	private String id; // 아이디
	private String head; // 문의 제목
	private String content; // 문의 내역
	private String reply; // 답변
	private int inq_no;
} 


// 글번호 , 문의 내역 , 문의 제목 문의 답변 , 