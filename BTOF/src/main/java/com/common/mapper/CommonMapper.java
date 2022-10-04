package com.common.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.common.domain.SignupVO;


@Mapper
public interface CommonMapper {
	
	public int idAvail(String id);

	public int nickAvail(String nick);

	public int register(SignupVO member);

	public int login(@Param("id") String id,@Param("pw") String pw);

	public int idFind(@Param("nick") String nick, @Param("tel") String tel);

	public String idCheck(@Param("nick") String nick, @Param("tel")String tel);

	public int pwCheck(@Param("id") String id, @Param("tel") String tel);

	public int getprice(String prod_name);

	public int renewprice(@Param("prod_name") String prod_name, @Param("price") int price, @Param("id") String id);

	public int getBalance(String id);

	public String getUserPower(String id);

	public String getPass(String nick);

	public int deleteAp(String nick);

	
	
}
