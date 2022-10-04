package com.product.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NowAucMapper {

	public int getBalance(String id);

	public String getId(String id);
	
	public String getTime(String setTime);
}
