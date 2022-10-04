package com.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.NowAucMapper;

@Service
public class NowAucServiceImpl implements NowAucService {

	@Autowired
	private NowAucMapper nowAucMapper;
	
	@Override
	public int getBalance(String id) {
		int balance = nowAucMapper.getBalance(id);
		return balance;
	}

	public NowAucMapper getNowAucMapper() {
		return nowAucMapper;
	}

	public void setNowAucMapper(NowAucMapper nowAucMapper) {
		this.nowAucMapper = nowAucMapper;
	}

	@Override
	public String getId(String id) {
		String id1 = nowAucMapper.getId(id);
		return id1;
	}

	@Override
	public String getTime(String setTime) {
		return nowAucMapper.getTime(setTime);
	}
	

}
