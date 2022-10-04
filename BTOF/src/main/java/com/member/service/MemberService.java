package com.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.member.domain.AccountInfoVO;
import com.member.domain.CashFlowRecordVO;
import com.member.domain.WishListVO;
import com.product.domain.SellStatusVO;
import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;

public interface MemberService {

	public int addMember(MemberVO member);


	public String checkOwner(int prod_num);

	public int checkAccount(String Owner, String ac_num);

	public int checkPw(String pwch);

	public int insPref(PrefVO pref);

	// public int createUUID(String prod_name, String artist, int price, int pieces);
	
	public String getUserPower(String id);

	public int addArtist(ArtistVO artist);
	

	public String getNick(String id);


	public int insArtist(ArtistVO vo);


	public String getArtist(String id);


	public int insProd(EnrollProductVO enroll);


	public String getNickName(String id);


	public int pwchg(MemberVO member);


	public int tellch(MemberVO member);


	public String getTell(String id);


	public int deleteMember(MemberVO member, HttpServletResponse response);


	public List<MemberVO> getMypage(String id);


	public int nickch(MemberVO member);
	
	public List<SellStatusVO> getOwnPro(String id);


	public int getProd_no(String prod_name, String artist);
	
	
	public int getBalance(String id);

	public int updateBalance(int addamount, String id);
	
	public int purchase(int prod_no, String id);
	
	public int getPrice(int prod_no);
	
	public int getStock(int prod_no);
	
	public int deductStock(int stock, int prod_no);

	
	//좋아요 기능
	public int updateLike(String id, int prod_no);
	public int getLikes(String id, int prod_no); // 임시로 
	/*
	public int checkLike(String id, int prod_no);

	public int insertLikeToUser(String id, int prod_no);

	public int insertLikeToProduct(int prod_no);

	public int deleteLike(String id, int prod_no);
	*/
	public int recordCashFlowForDeposit(String r_id, int deposit);

	public int recordCashFlowForWithdrawal(String r_id, int withdraw);

	
	//거래 조회
	public List<CashFlowRecordVO> showRecordForCashFlow(String id, Integer num);

	public int doYouHaveAccount(String id);

	
	//계좌 정보 조회
	public AccountInfoVO getAccountInfo(String id);


	public List<WishListVO> getMyWishList(String id);


}
