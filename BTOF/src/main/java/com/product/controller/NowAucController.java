package com.product.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.product.service.NowAucService;

@Controller
@RequestMapping("/product/")
public class NowAucController {
	
	@Autowired
	NowAucService nowAucService;

	@RequestMapping(value = "/buyBid", method = RequestMethod.POST)
	public String balanceProcess(@RequestParam String id, HttpServletRequest request, Model model) {
		String id1 = nowAucService.getId(id);
		int balance = Integer.parseInt(String.valueOf(nowAucService.getBalance(id)));
		model.addAttribute(balance);
		model.addAttribute(id1);
		return "/product/buyBid";
	}
	@RequestMapping(value = "/buyAuction", method = RequestMethod.POST)
	public String idToss(@RequestParam String id, HttpServletRequest request, Model model) {
		String id1 = nowAucService.getId(id);
		model.addAttribute(id1);
		return "/product/buyAuction";		
	}
	
	@RequestMapping("setTime")
	public String setTime() {
		System.out.println("setTime 요청");
		return "/product/setTime";
	}
	
	@RequestMapping("buyAuction")
	public String setTimeProcess(HttpSession session, HttpServletRequest request, Model model) {
		
		String sY = request.getParameter("startYear"); String sM = request.getParameter("startMon"); String sD = request.getParameter("startDay"); String sH = request.getParameter("startHour"); String sMi = request.getParameter("startMin"); String sS = request.getParameter("startSec");
		String oY = request.getParameter("openYear"); String oM = request.getParameter("openMon"); String oD = request.getParameter("openDay"); String oH = request.getParameter("openHour"); String oMi = request.getParameter("openMin"); String oS = request.getParameter("openSec");
		String eY = request.getParameter("endYear"); String eM = request.getParameter("endMon"); String eD = request.getParameter("endDay"); String eH = request.getParameter("endHour"); String eMi = request.getParameter("endMin"); String eS = request.getParameter("endSec");
		String start = sY+"-"+sM+"-"+sD+" "+sH+":"+sMi+":"+sS;
		String open = oY+"-"+oM+"-"+oD+" "+oH+":"+oMi+":"+oS;
		String endT = eY+"-"+eM+"-"+eD+" "+eH+":"+eMi+":"+eS;
		String result = "";
		
		Date now = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			Date start_time = dateFormat.parse(start);
			Date end_time = dateFormat.parse(endT);
			Date open_time = dateFormat.parse(open);
			
			if( now.getTime() < end_time.getTime()) {
				
				// HttpSession session = request.getSession();
				model.addAttribute("now", now);
				model.addAttribute("start", start_time);
				model.addAttribute("open", open_time);
				model.addAttribute("end", end_time);
				
				result = "product/buyBid";
			}else if(now.getTime() < start_time.getTime()){
				result = "product/yet";
			}else {
				result = "product/end";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

}
