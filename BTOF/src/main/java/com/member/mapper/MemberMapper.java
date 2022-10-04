package com.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.member.domain.AccountInfoVO;
import com.member.domain.CashFlowRecordVO;
import com.member.domain.WishListVO;
import com.product.domain.SellStatusVO;
import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;

public interface MemberMapper {

	public int addMember(MemberVO member);
	
	public MemberVO getMember(String id);

	public void enrollProduct(@Param("id") String id,@Param("prod_name") String prod_name, @Param("price") int pieces,@Param("price") int price, @Param("content") String content,
			@Param("serial_num") List<String> serial_num, @Param("uuid_val") List<String> uuid_val);

	public String checkOwner(int prod_num);

	public int checkAccount(@Param("Owner") String Owner, @Param("ac_num")String ac_num);

	public int checkPw(String pwch);

	public int InsPref(PrefVO pref);

	public int insProduct(@Param("id") String id,@Param("prod_name") String prod_name,@Param("pieces") int pieces,@Param("content") String content, @Param("cate") String cate, @Param("file") String fileName);

	public int insProd_dtl(@Param("id") String id,@Param("price") int price, @Param("uuid") String string);

	public int insUUID(@Param("prod_name") String prod_name, @Param("artist") String artist, @Param("price") long price, @Param("uuid") String string);

	public int addArtist(ArtistVO artist);

	public String getNick(String id);

	public int insArtist(ArtistVO vo);

	public String getArtist(String id);

	public int insProd(EnrollProductVO enroll);
	
	public List<SellStatusVO> getOwnPro(String id);

	public int getProd_no(@Param("prod_name") String prod_name, @Param("artist")String artist);

	public int deleteMember(String id); // 회원탈퇴
	
	public int IdPwCheck(MemberVO memberVO); // 아이디중복확인

	public int pwchg(MemberVO member); // 비밀번호 변경
	
	public int nickch(MemberVO member);// 닉네임 변경
	
	public String getNickName(String id); // 닉네임 가져오기

	public int tellch(MemberVO member); //휴대번호 변경

	public String getTell(String id); // 휴대번호 가져오기

	public List<MemberVO> getMypage(String id); // 마이페이지 정보가져오기
	
	public int getBalance(String id);
	
	public int updateBalance(@Param("addamount") int addamount, @Param("id") String id);

	public int purchase(@Param("prod_no") int prod_no, @Param("id")String id);

	public int getPrice(@Param("prod_no") int prod_no);

	public int getStock(@Param("prod_no") int prod_no);

	public int deductStock(@Param("stock") int stock, @Param("prod_no") int prod_no);


		
		

		//좋아요 기능
	public int checkLike(@Param("id")String id, @Param("prod_no")int prod_no);

	public int insertLikeToUser(@Param("id")String id, @Param("prod_no")int prod_no);

	public int insertLikeToProduct(int prod_no);

	public int deleteLikeToProduct(int prod_no);
	
	public int deleteLike(@Param("id")String id, @Param("prod_no")int prod_no);

	
	//캐쉬인 캐쉬아웃 기록
	public int recordCashFlowForDeposit(@Param("r_id") String r_id, @Param("deposit") int deposit);

	public int recordCashFlowForWithdrawal(@Param("r_id")String r_id, @Param("withdraw")int withdraw);

	public List<CashFlowRecordVO> showRecordForCashFlow(@Param("id") String id, @Param("num") Integer num);

	
	//계좌있는지 확인
	public int doYouHaveAccount(String id);

	//계좌정보
	public AccountInfoVO getAccountInfo(String id);

	public List<WishListVO> getMyWishList(String id);
	
}
