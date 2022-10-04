package com.common.service;

import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.resource.HttpResource;

import com.common.domain.SignupVO;

public interface CommonService {

	public int  idAvail(String id);

	public int NickAvail(String nick);

	public int register(SignupVO member);

	public int login(String id, String pw, HttpServletResponse response);

	public String idCheck(String nick, String tel);

	public int pwCheck(String id, String tel);

	public int idFind(String nick, String tel);

	public int getprice(String prod_name);

	public int renewprice(String prod_name, int price, String id);

	public int getBalance(String id);

	public String getUserPower(String id);

	public String getPass(String nick);

	public int deleteAp(String nick);

}
