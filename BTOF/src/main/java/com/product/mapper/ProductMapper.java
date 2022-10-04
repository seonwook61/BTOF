package com.product.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.member.domain.ArtistVO;
import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.domain.SellVO;

public interface ProductMapper {
	
	// 글 하나 가져오기 
	//public ProductDtlVO readDtl(int prod_dtl_no);
	public ProductVO read(int prod_no);
	
	// 페이징처리해서 전체 글 가져오기 
	public List<ProductVO> getListWithPaging(Criteria cri); 
	
	//카테고리에 따라 글 가져오기
	public List<ProductVO> getListWithCate(Criteria cri);
	
	// 전체 글의 개수 가져오기 
	public int getTotalCount(Criteria cri);
	
	// 글 전체 가져오기 
	public List<ProductVO> getList(); 
	
	// 판매 처리
	public int sellProd(List<ProductVO> prod_no);
	
	// 아티스트 작품 가져오기
	public List<ProductVO> getListWithArtist(Criteria cri);
	
	// 오너가져오기
	public String getOwner(int prod_no);
	
	//로그인한 아이디로 닉네임 가져오기
	public String getIdUser(String id);
	
	public List<ProductVO> getListWithOwn(Criteria cri);

	public List<SellStatusVO> getSellList(@Param("artist") String artist, @Param("prod_name") String prod_name);

	public SellStatusVO getBidPrice(SellStatusVO vo);

	public SellStatusVO getProd_dtl(SellStatusVO vo);
	
	public String getUserPower(String id);


	public int addArtist(ArtistVO artist);
	
	public int getBalance(SellStatusVO vo);

	public int changeBid( SellStatusVO vo);

	public int deduct(@Param("leftover")int leftover,@Param("id") String id);

	public int changeOwner(SellStatusVO vo);

	public String findSeller(int buyer_tel);

	public int updateOwner(PayInfoVO info);

	public int insHistory(PayInfoVO info);

	//광범님 끝

	public List<ProductVO> getRow(ProductVO product);
	
	public List<Integer> getSellListWithF(SellVO vo);

	public List<Integer> getSN(SellVO vo);
	

	//public List<ProductVO> getMyListAllSerial(ProductVO product);
	
	//public int updateWallet(String id);

	public int updateSales(int sn);
	
	public int updatePrice(@Param("sn")int sn,@Param("price") int price);
	
	public List<String> getTF(SellVO vo);
	
	public int updateAucSales(int sn);
	
	public int updateBidPrice(@Param("sn") int sn, @Param("startPrice") int startPrice);
	
	public int updateEndDay(@Param("sn")int sn, @Param("endDay") Date endDay);

	public List<ProductVO> getListWithOwn(String prod_dtl_own);

	public String getSales(int prod_no);

	public int getOwnerCount(String id);
	
	
}