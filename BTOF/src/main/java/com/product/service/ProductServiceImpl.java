package com.product.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.domain.SellVO;
import com.product.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public ProductVO get(int prod_no) {
			return productMapper.read(prod_no);
	}
	

	@Override
	public List<ProductVO> getList(Criteria cri) {
		System.out.println(cri);
		return productMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return productMapper.getTotalCount(cri);
	}

	@Override
	public List<ProductVO> getCate(Criteria cri) {
		System.out.println(cri);
		return productMapper.getListWithCate(cri);
	}


	@Override
	public boolean sellProd(List<ProductVO> prod_no) {
		
		return productMapper.sellProd(prod_no) == 1;
	}


	@Override
	public List<ProductVO> getArtistProdList(Criteria cri) {
		
		return productMapper.getListWithArtist(cri);
	}


	@Override
	public String getOwner(int prod_no) {
		
		return productMapper.getOwner(prod_no);
	}
	@Override
	public int getOwnerCount(String id) {
		
		return productMapper.getOwnerCount(id);
	}



	@Override
	public String getIdUser(String id) {
		
		return productMapper.getIdUser(id);
	}



	@Override
	public List<ProductVO> getOwnList(String prod_dtl_own) {
		return productMapper.getListWithOwn(prod_dtl_own);
	}
	@Override
	public String getSales(int prod_no) {
		return productMapper.getSales(prod_no);
	}
	/*
	@Override
	public List<ProductVO> getOwnList(Criteria cri) {
		return productMapper.getListWithOwn(cri);
	}
	 */
	// 광범님 시작
	@Override
	public List<SellStatusVO> getSellList(SellStatusVO vo) {
				String artist =vo.getProd_artist();
				String prod_name= vo.getProd_name();
				List<SellStatusVO> list = productMapper.getSellList(artist,prod_name);
		return  list;
	}


	@Override
	public SellStatusVO getBidPrice(SellStatusVO vo) {

		vo = productMapper.getBidPrice(vo);	
		
		return vo;
	}


	@Override
	public SellStatusVO getProd_dtl(SellStatusVO vo) {
		
			vo = productMapper.getProd_dtl(vo);
		return vo;
	}


	@Override
	public int changeBid(SellStatusVO vo) {
			int result = productMapper.changeBid(vo);
		return result;
	}


	@Override
	public int getBalance(SellStatusVO vo) {
		int balance = productMapper.getBalance(vo);
				return balance;
	}


	@Override
	public int deduct(int leftover,String id) {
		int result = productMapper.deduct(leftover,id);
		return result;
	}


	@Override
	public void changeOwner(SellStatusVO vo) {

		int result = productMapper.changeOwner(vo);
		
		
	}


	@Override
	public String findSeller(int buyer_tel) {
		String seller = productMapper.findSeller(buyer_tel);
		return seller;
	}


	@Override
	public int updateOwner(PayInfoVO info) {
		int result = productMapper.updateOwner(info);
		return result;
	}


	@Override
	public int InsHistory(PayInfoVO info) {
	int result=	productMapper.insHistory(info);
		return result;
	}

	// 광범님 끝

	@Override
	public List<ProductVO> getRow(ProductVO product) {
		
		return productMapper.getRow(product);
	}

	@Override
	public List<Integer> getSellListWithF(SellVO vo) {
		return productMapper.getSellListWithF(vo);
	}


	@Override
	public List<Integer> getSN(SellVO vo) {
		return productMapper.getSN(vo);
	}

//	@Override
//	public List<ProductVO> getMyListAllSerial(ProductVO product) {
//		
//		return productMapper.getMyListAllSerial(product);
//	}

//	@Override
//	public int updateWallet(String id) {
//		
//		return productMapper.updateWallet(id);
//	}
//	
	@Override
	public int updateSales(int sn) {
		return productMapper.updateSales(sn);
	}
	
	@Override
	public int updatePrice(int sn, int price) {
		return productMapper.updatePrice(sn, price);
	}
	
	@Override
	public List<String> getTF(SellVO vo){
		return productMapper.getTF(vo);
	}
	
	@Override
	public int updateAucSales(int sn) {
		return productMapper.updateAucSales(sn);
	}
	
	@Override
	public int updateBidPrice(int sn, int startPrice) {
		return productMapper.updateBidPrice(sn, startPrice);
	}
	@Override
	public int updateEndDay(int sn, Date endDay) {
		return productMapper.updateEndDay(sn, endDay);
	}


	@Override
	public List<ProductVO> getOwnList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

}
