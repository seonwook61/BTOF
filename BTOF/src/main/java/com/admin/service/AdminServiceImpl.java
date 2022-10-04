package com.admin.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.domain.Criteria;
import com.admin.domain.ProductVO;
import com.admin.mapper.AdminMapper;
import com.board.domain.InquiryVO;
import com.member.mapper.MemberMapper;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private MemberMapper memberMapper;

	// 승인 처리
	@Override
	public int updatePass(ProductVO product) {
		
		
		
		return adminMapper.updatePass(product);
		
		
		
	}
	
	// 승인 거부 처리
	@Override
	public int updateRefues(ProductVO product) {
		
		return adminMapper.updateRefues(product);
	}
	
	// 승인 거부시 삭제
	
	public int deleteRefues(ProductVO product) {
		return adminMapper.deleteRefues(product);
	}
	
	
	
	@Override
	public List<ProductVO> getList(Criteria cri) {
		System.out.println(cri);
		
		return adminMapper.getListWithPaging(cri); 
	}

	@Override
	public ProductVO get(int prod_no) {
		return adminMapper.read(prod_no);
	}

	@Override
	public List<InquiryVO> getInqList() {
			
		List<InquiryVO> list = adminMapper.getInqList();
		return list;
	}

	@Override
	public InquiryVO getInq(InquiryVO vo) {
		vo = adminMapper.getInq(vo);
		return vo;
	}

	@Override
	public int updateInq(InquiryVO vo) {
		int result = adminMapper.updateInq(vo);
		return result;
	}

	@Override
	public ProductVO bringPro(ProductVO product) {
		
		product = adminMapper.bringPro(product);
		return product;
	}


	@Override
	public int createUUID(String prod_dtl_name, String prod_dtl_artist, long price, int pieces) {
		String[] uuid_val = new String[pieces];
		for(int i = 0; i<pieces; i++) {
			UUID uuid = UUID.randomUUID();
			String str = uuid+"_";
				uuid_val[i]=str;
				}
				int result = -1;
				System.out.println("그냥 piece---"+pieces);
				for(int i=0 ; i<pieces;i++){
						System.out.println("for문 입니다");
					result =memberMapper.insUUID(prod_dtl_name,prod_dtl_artist,price,uuid_val[i]);
				}

		
				return result;
	
	
	}
}
