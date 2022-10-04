package com.common.mapper;

import java.util.Calendar;
import java.util.List;

import com.common.domain.AttendVO;
import com.common.domain.Criteria;
import com.common.domain.MainVO;

public interface MainMapper {
	
	// 달력 체크정보 가져오기
	public List<Calendar> getCalendarList(String id);
	
	// 출석체크하기
	public int Poincheck(String userId);
	
	// 출석정보 가져오기
	public AttendVO Attendance(String userId);
	//public Calendar getCalendarByDate(String userId);
	
	// 메인에 뿌려줄 전체
	public List<MainVO> showList();
	
	// 글하나 가져오기
	public MainVO get(Integer no);

	/* 상품 검색 */
	public List<MainVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	
	/* 작가 이름 리스트 요청 */
	public String[] getArtistList(String keyword);
	
	/* 작품 태그 리스트 요청 */
	public String[] getTagList(String keyword);

	
	
	
	
	//아이디로 닉네임 가져오기
	public String getOwnWithId(String stat);

}
