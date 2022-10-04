package com.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CashFlowRecordVO {

	
	private String id;
	private int withdrawal;
	private int deposit;
	private Date recordDate;
	
}
