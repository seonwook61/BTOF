package com.common.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.common.domain.SignupVO;
import com.common.mapper.CommonMapper;
import com.member.domain.MemberVO;

@Service
public class CommonServiceImpl implements CommonService  {
		@Autowired
		private CommonMapper commonMapper;
	
	@Override
	public int idAvail(String id) {
		
	int result=	commonMapper.idAvail(id);
			
		return result;
	}

	@Override
	public int NickAvail(String nick) {
		
		int result = commonMapper.nickAvail(nick);
		System.out.println("serviceimpl result :"+result);
		
		return result;
	}

	@Override
	public int register(SignupVO member) {
			System.out.println(member); 
			int result = -1;
			result = commonMapper.register(member);
		return result;
	}
	
	// 세션가져오기 (메서드로 중복코드 분리) 
		private HttpSession getSession() {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
			HttpSession session = request.getSession(); 
			return session;
		}

	@Override
	public int login(String id, String pw, HttpServletResponse response) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
		Cookie[] coos = request.getCookies(); 
		if(coos != null) {
			for(Cookie c : coos) { // 쿠키가 있으면 member객체에 id,pw 체우기 
				if(c.getName().equals("cookieId")) id=(c.getValue());
				if(c.getName().equals("cookiePw")) pw=(c.getValue());
			}
		}
		// id, pw 일치하는지 DB가서 확인 
		
		
		
		//아래는 광범님
		int result = commonMapper.login(id,pw);
		HttpSession session = getSession();
		
		// 일치하면 세션만들고, 쿠키 원하면 만들기 
			if(result == 1) {
				if(session.getAttribute("memId") == null) {
					session.setAttribute("memId", id);
				}
				
			}
		return result;
	}

	@Override
	public String idCheck(String nick, String tel) {
			String id = commonMapper.idCheck(nick,tel);
		return id;
	}

	@Override
	public int pwCheck(String id, String tel) {

			int result = commonMapper.pwCheck(id,tel);
		return result;
	}

	@Override
	public int idFind(String nick, String tel) {
		
			int result = commonMapper.idFind(nick,tel);
		return result;
	}

	@Override
	public int getprice(String prod_name) {
		
		int highprice = commonMapper.getprice(prod_name);
		return highprice;
	}

	@Override
	public int renewprice(String prod_name, int price,String id) {
		int result = commonMapper.renewprice(prod_name,price,id);
		return result;
	}

	@Override
	public int getBalance(String id) {
			int balance = commonMapper.getBalance(id);
		return balance;
	}

	@Override
	public String getUserPower(String id) {
		String power = commonMapper.getUserPower(id);
		return power;
	}

	@Override
	public String getPass(String nick) {
		String artist_pass = commonMapper.getPass(nick);
		return artist_pass;
	}

	@Override
	public int deleteAp(String nick) {
		int delete_res = commonMapper.deleteAp(nick);
		return delete_res;
	}

	
	
}
