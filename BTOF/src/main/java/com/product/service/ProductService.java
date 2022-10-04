package com.product.service;

import java.sql.Date;
import java.util.List;

import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.domain.SellVO;

public interface ProductService {
		
		// 글 하나 가져오기 
		public ProductVO get(int prod_no);
		
		// 전체글 페이징처리해서 가져오기
		public List<ProductVO> getList(Criteria cri);
		
		//카테고리
		public List<ProductVO> getCate(Criteria cri);
		
		// 전체 글의 개수 가져오기
		public int getTotal(Criteria cri);
		
		//판매기능
		public boolean sellProd(List<ProductVO> prod_no);

		//아티스트작품보기
		public List<ProductVO> getArtistProdList(Criteria cri);

		//오너일때 판매 아닐때 구매
		public String getOwner(int prod_no);
		public int getOwnerCount(String id);
		
		//로그인한 아이디로 닉네임가져오기
		public String getIdUser(String id);

		public List<ProductVO> getOwnList(String prod_dtl_own);

		public String getSales(int prod_no);

		public List<ProductVO> getOwnList(Criteria cri);
		//광범님시작
		public List<SellStatusVO> getSellList(SellStatusVO vo);

		public SellStatusVO getBidPrice(SellStatusVO vo);

		public SellStatusVO getProd_dtl(SellStatusVO vo);

		public int changeBid(SellStatusVO vo);

		public int getBalance(SellStatusVO vo);

		public int deduct(int leftover,String id);

		public void changeOwner(SellStatusVO vo);

		public String findSeller(int buyer_tel);

		public int updateOwner(PayInfoVO info);

		public int InsHistory(PayInfoVO info);

		//광범님끝

		public List<ProductVO> getRow(ProductVO product);

		public List<Integer> getSellListWithF(SellVO vo);

		public List<Integer> getSN(SellVO vo);
		
		//public List<ProductVO> getMyListAllSerial(ProductVO product);
	
		//public int updateWallet(String id);
		
		public int updateSales(int sn);
		
		public int updatePrice(int sn, int price);
		
		public List<String> getTF(SellVO vo);
		
		public int updateAucSales(int sn);
		
		public int updateBidPrice(int sn, int startPrice);
		
		public int updateEndDay(int sn, Date endDay);

}
