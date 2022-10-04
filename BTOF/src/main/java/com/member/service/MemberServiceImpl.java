package com.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.member.domain.AccountInfoVO;
import com.member.domain.CashFlowRecordVO;
import com.member.domain.WishListVO;
import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.MemberVO;
import com.member.domain.PrefVO;
import com.member.mapper.MemberMapper;
import com.product.domain.SellStatusVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper memberMapper;
	
	@Override
	public int addMember(MemberVO member) {
		int result = memberMapper.addMember(member);
		return result;
	}

	@Override
	public String checkOwner(int prod_num) {
		String Owner = memberMapper.checkOwner(prod_num);
		return Owner;
	}

	@Override
	public int checkAccount(String Owner, String ac_num) {
		System.out.println("serviceImpl 입니다");
		System.out.println("acOwenr :"+Owner);
		System.out.println("ac_num :"+ac_num);
		int result = memberMapper.checkAccount(Owner,ac_num);
		return result;
	}

	@Override
	public int checkPw(String pwch) {
		int result = memberMapper.checkPw(pwch);
		return result;
	}

	@Override
	public int insPref(PrefVO pref) {
		if(pref.getAchi()==null) {
			pref.setAchi("F");
		}else {
			pref.setAchi("T");
		}
		if(pref.getAnimal()==null) {
			pref.setAnimal("F");
		}else {
			pref.setAnimal("T");
		}
		if(pref.getArt()==null) {
			pref.setArt("F");
		}else {
			pref.setArt("T");
		}
		if(pref.getAchi()==null) {
			pref.setBallet("F");
		}else {
			pref.setBallet("T");
		}
		if(pref.getCraft()==null) {
			pref.setCraft("F");
		}else {
			pref.setCraft("T");
		}
		if(pref.getFashion()==null) {
			pref.setFashion("F");
		}else {
			pref.setFashion("T");
		}
		if(pref.getGame()==null) {
			pref.setGame("F");
		}else {
			pref.setGame("T");
		}
		if(pref.getMusic()==null) {
			pref.setMusic("F");
		}else {
			pref.setMusic("T");
		}
		if(pref.getNature()==null) {
			pref.setNature("F");
		}else {
			pref.setNature("T");
		}
		if(pref.getPhoto()==null) {
			pref.setPhoto("F");
		}else {
			pref.setPhoto("T");
		}
		if(pref.getReli()==null) {
			pref.setReli("F");
		}else {
			pref.setReli("T");
		}
		if(pref.getScience()==null) {
			pref.setScience("F");
		}else {
			pref.setScience("T");
		}
		if(pref.getSports()==null) {
			pref.setSports("F");
		}else {
			pref.setSports("T");
		}
		if(pref.getTrip()==null) {
			pref.setTrip("F");
		}else {
			pref.setTrip("T");
		}
		if(pref.getVideo()==null) {
			pref.setVideo("F");
		}else {
			pref.setVideo("T");
		}
		if(pref.getVr()==null) {
			pref.setVr("F");
		}else {
			pref.setVr("T");
		}
		
			System.out.println(pref);
		int result = memberMapper.InsPref(pref);
		return result;
	
	}

	@Override
	public int addArtist(ArtistVO artist) {
		int resultArtist = memberMapper.addArtist(artist);
		return resultArtist;
	}

	@Override
	public String getUserPower(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNick(String id) {
		String nick = memberMapper.getNick(id);
		
		return nick;
	}

	@Override
	public int insArtist(ArtistVO vo) {
		int result =memberMapper.insArtist(vo);	
		return result;
	}

	@Override
	public String getArtist(String id) {
		
		String artist =memberMapper.getArtist(id);
		return artist;
	}

	@Override
	public int insProd(EnrollProductVO enroll) {
		int result =memberMapper.insProd(enroll);
		return result;
	}
	@Override
	public List<SellStatusVO> getOwnPro(String id) {
		List<SellStatusVO> list = memberMapper.getOwnPro(id);
		return list;
	}

	@Override
	public int getProd_no(String prod_name, String artist) {
		int prod_no = memberMapper.getProd_no(prod_name,artist);
		return prod_no;
	}


	@Override
	public String getNickName(String id) {
		return memberMapper.getNickName(id);

	}

	@Override
	public int pwchg(MemberVO member) {
		int result = memberMapper.pwchg(member);
		return result;
	}

	@Override
	public int tellch(MemberVO member) {
		return memberMapper.tellch(member);
	}

	@Override
	public String getTell(String id) {
		return memberMapper.getTell(id);
	}

	@Override
	public int deleteMember(MemberVO memberVO, HttpServletResponse response) {
		HttpSession session = getSession();
		String id = (String)session.getAttribute("memId");
		memberVO.setId(id);
		
		int result = memberMapper.IdPwCheck(memberVO);
		
		if(result == 1) {
			int deleteRes = memberMapper.deleteMember(memberVO.getId());
			System.out.println("S delete result :" + deleteRes); // 개발자만확인
			//로그아웃
	}
		
		return result; 
		
	}
	// 세션가져오기 (메서드로 중복코드 분리) 
	private HttpSession getSession() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
		HttpSession session = request.getSession(); 
		return session;
	}
	@Override
	public List<MemberVO> getMypage(String id) {
		return memberMapper.getMypage(id);
	}

	@Override
	public int nickch(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getBalance(String id) {
		int balance = memberMapper.getBalance(id);
	return balance;
	}
	
	@Override
	public int updateBalance(int addamount, String id) {
		int result = memberMapper.updateBalance(addamount, id);
		return result;
	}

	@Override
	public int purchase(int prod_no, String id) {
		int result = memberMapper.purchase(prod_no, id);
		return result;
	}

	@Override
	public int getPrice(int prod_no) {
		int result = memberMapper.getPrice(prod_no);
		return result;
	}

	@Override
	public int getStock(int prod_no) {
		int result = memberMapper.getStock(prod_no);
		return result;
	}

	@Override
	public int deductStock(int stock, int prod_no) {
		int result = memberMapper.deductStock(stock, prod_no);
		return result;
	}
	
	//Map<> updatedStockandBalance = new hashMap{}();
	
	
	
	
	//좋아요 기능
	//@Transactional
	@Override
	public int updateLike(String id, int prod_no) {
		int result = memberMapper.checkLike(id,  prod_no); // 1 = 하트 끄기, 0 = 하트켜기 
		
		if(result == 0) {
			// 라이크 한적있다 -> 라이크 지우기  
			memberMapper.insertLikeToUser(id, prod_no);
			memberMapper.insertLikeToProduct(prod_no); //1 
		}else { 
			// 라이크 안했다 -> 라이크 추가 
			memberMapper.deleteLike(id, prod_no); // 0
			memberMapper.deleteLikeToProduct(prod_no);
		}
		return result;
	}
	@Override
	public int getLikes(String id, int prod_no) {
		return memberMapper.checkLike(id, prod_no); // 해당 id,prod_no 의 라이크 개수 가져와
	}
	
	
	/*
	@Override
	public int insertLikeToUser(String id, int prod_no) {
		return memberMapper.insertLikeToUser(id, prod_no);
	}
	@Override
	public int insertLikeToProduct(int prod_no) {
		return memberMapper.insertLikeToProduct(prod_no);
		
	}

	@Override
	public int deleteLike(String id, int prod_no) {
		return memberMapper.deleteLike(id, prod_no);
	}*/

	@Override
	public int recordCashFlowForDeposit(String r_id, int deposit) {
		return memberMapper.recordCashFlowForDeposit(r_id, deposit);
	}

	@Override
	public int recordCashFlowForWithdrawal(String r_id, int withdraw) {
		return memberMapper.recordCashFlowForWithdrawal(r_id, withdraw);
	}

	@Override
	public List<CashFlowRecordVO> showRecordForCashFlow(String id, Integer num) {
		return memberMapper.showRecordForCashFlow(id, num);
	}

	@Override
	public int doYouHaveAccount(String id) {
		return memberMapper.doYouHaveAccount(id);
	}

	@Override
	public AccountInfoVO getAccountInfo(String id) {
		return memberMapper.getAccountInfo(id);
	}

	@Override
	public List<WishListVO> getMyWishList(String id) {
		return memberMapper.getMyWishList(id);
	}

}
	
	


