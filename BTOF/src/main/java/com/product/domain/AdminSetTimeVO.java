package com.product.domain;

import lombok.Data;

@Data
public class AdminSetTimeVO {
	
	private String openTime;
	private String closeTime;
	private String startPrice;
	private String eventBox;
	
	public String getOpenT() {
		return getOpenTime();
	}
	public String getCloseT() {
		return getCloseTime();
	}
	
}
