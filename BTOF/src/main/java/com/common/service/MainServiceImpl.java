package com.common.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.domain.Criteria;
import com.common.domain.MainVO;
import com.common.mapper.MainMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service 
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mainMapper;
	
	
	
	/*
	@Override
	public List<Calendar> getCalendar() {
		
		List<Calendar> calendar = null;
		
		calendar= sqlSession.selectList(mainMapper.calendarList());
		return calendar; 
		
	}
		
	}
	*/
	public List<MainVO> showList(){
		System.out.println("메퍼 :" + mainMapper.showList());
		return mainMapper.showList();
	}

	@Override
	public MainVO get(Integer no) {
		return mainMapper.get(no);
	}

	@Override
	public List<MainVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");
		
		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] artistArr = mainMapper.getArtistList(cri.getKeyword());
		String[] tagArr = mainMapper.getTagList(cri.getKeyword());
		
		
		if(type.equals("A") || type.equals("AT") || type.equals("AN") || type.equals("ATN")) {
			if(artistArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String a : typeArr) {
			if(a.equals("A")) {
				cri.setArtistArr(artistArr);
			}
		}
		
		if(type.equals("T") || type.equals("TA") || type.equals("TN") || type.equals("TAN")) {
			if(tagArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String b : typeArr) {
			if(b.equals("T")) {
				cri.setTagArr(tagArr);
			}
		}
		
		
		
		
		
		
		return mainMapper.getGoodsList(cri);
		
	}

	@Override
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().......");	
		return mainMapper.goodsGetTotal(cri);
	}

	@Override
	public String getOwnWithId(String stat) {
		return mainMapper.getOwnWithId(stat);
	}

	

	

	

}
