package com.admin.service;

import java.util.List;

import com.admin.domain.Criteria;
import com.admin.domain.ProductVO;
import com.board.domain.InquiryVO;


public interface AdminService {
	
	// 전체글 페이징처리해서 가져오기
	public List<ProductVO> getList(Criteria cri);

	// 해당 작품 정보가져오기
	public ProductVO get(int prod_no);

	//승인처리
	public int updatePass(ProductVO product);
	
	//거부처리 
	public int updateRefues(ProductVO product);
	
	//승인거부시 삭제처리
	public int deleteRefues(ProductVO product);

	public List<InquiryVO> getInqList();

	public InquiryVO getInq(InquiryVO vo);

	public int updateInq(InquiryVO vo);

	public ProductVO bringPro(ProductVO product);

	public int createUUID(String prod_dtl_name, String prod_dtl_artist, long price, int pieces);

	

	

	
	
}
