package com.common.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	// 태그 리스트 (db랑 맞출지)
	private String[] tagArr;
	
	// 아티스트 리스트
	private String[] artistArr;
	
	// 카테고리 리스트
	private String[] cateArr;
	
	// 가격 범위
	private Integer price;
	
	
	
		
	
	/* 현재 페이지 번호 */
	private int pageNum;
	
	/* 페이지 표시 개수 */
	private int amount;
	
	/* 검색 타입 */
	private String type;
	
	/* 검색 키워드 */
	private String keyword;
	
	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/* Criteria 기본 생성자 */
	public Criteria(){
		this(1,10);
	}
	
	/* 검색 타입 데이터 배열 변환 */
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}
	
	

}
