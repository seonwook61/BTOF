package com.common.service;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.common.domain.Criteria;
import com.common.domain.MainVO;

public interface MainService {
	
	
	
	//public List<Calendar> getCalendar();
	
	// 전체 가져오기
	public List<MainVO> showList();

	// 글하나 가져오기
	public MainVO get(Integer no);
	
	/* 상품 검색 */
	public List<MainVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);

	
	//id로 닉네임 가져오기
	public String getOwnWithId(String stat);

	
}
