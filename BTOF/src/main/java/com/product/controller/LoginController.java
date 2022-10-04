package com.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.common.service.CommonService;
import com.member.service.MemberService;
import com.product.domain.AdminSetTimeVO;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	MemberService memberService;
	@Autowired
	CommonService commonService;
	
	// 관리자가 이벤트 시간 설정, 파일 등록하는 페이지 처리
	@RequestMapping("setTime")
	public String setTime() {
		System.out.println("setTime 요청");
		return "/product/setTime";
	}
	
	private static AdminSetTimeVO timeVO;
	

	@PostMapping("adminSetT")
	public String adminSetT(AdminSetTimeVO vo, MultipartHttpServletRequest request, Model model) {
		MultipartFile mf = request.getFile("eventItem");
		String savePath = request.getRealPath("resources\\video");
		String orgName = mf.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String newName = uuid + orgName; 
		String imgPath = savePath +"\\"+newName;
		File f = new File(imgPath);
		try {
			mf.transferTo(f);
		}catch(IOException e) {
			e.printStackTrace();
		}
		vo.setEventBox(newName);
		timeVO = vo;
		System.out.println(vo);
		int login_res = 1;
		model.addAttribute("login_res", login_res);
		return "redirect:/admin/main";
	}
	// 입장 페이지 처리
	@RequestMapping("buyAuction")
	public String login(HttpSession session, Model model, HttpServletResponse response) throws IOException, ParseException {
		// 관리자가 이벤트를 등록하지 않았을때 생기는 예외상황 처리
		if(timeVO==null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('현재 진행중인 경매가 없습니다.'); location.href='/common/main';</script>");
				out.flush();
			}else if(timeVO!=null){
				// 관리자가 경매에 참여하지 못하도록 처리
				String id = (String)session.getAttribute("memId");
				String power = commonService.getUserPower(id);
				if(power.equals("M")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('관리자는 경매에 참여하실 수 없습니다.'); location.href='/common/main';</script>");
					out.flush();
				}else{
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
				Date openT = dateFormat.parse(timeVO.getOpenT());
				Date closeT = dateFormat.parse(timeVO.getCloseT());
				model.addAttribute("openT", openT.getTime());
				model.addAttribute("closeT", closeT.getTime());
				model.addAttribute("eventBox", timeVO.getEventBox());
				return "/product/buyAuction";
				}
			}
			return null;
		}
	// 대기열 페이지 처리
	@RequestMapping(value = "/waitingRoom")
	public String goWaiting(HttpSession session, HttpServletRequest request, Model model) {
		
		System.out.println("waitingRoom!!!");
		System.out.println(timeVO);
		String result = "";
		String id = (String)session.getAttribute("memId");
		int balance = memberService.getBalance(id);
		System.out.println(balance);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		Date now = new Date();
		try {
			Date openT = dateFormat.parse(timeVO.getOpenT());
			Date closeT = dateFormat.parse(timeVO.getCloseT());
			System.out.println(openT);
			System.out.println(closeT);
			if( now.getTime() < openT.getTime()) {
				logger.info("Welcome "+id);
				
				model.addAttribute("openT", openT.getTime());
				model.addAttribute("balance", balance);
				model.addAttribute("eventBox", timeVO.getEventBox());
				
				result = "product/waitingRoom";
			}else if(now.getTime() >= openT.getTime() && now.getTime() < closeT.getTime()){
				result = "product/openEnd";
			}else {
				result = "product/end";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}	
	// 경매 페이지 처리
	@RequestMapping(value = "/buyBid")
	public String loginProcess(HttpSession session, HttpServletRequest request, Model model) {

		String result = "";
		
		int price = Integer.parseInt(timeVO.getStartPrice());
		String id = (String)session.getAttribute("memId");
		int balance = memberService.getBalance(id);
		System.out.println(balance);
	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		Date now = new Date();
		try {
			Date openT = dateFormat.parse(timeVO.getOpenT());
			Date closeT = dateFormat.parse(timeVO.getCloseT());
			
			if( now.getTime() < closeT.getTime()) {
				logger.info("Welcome "+id);
				
				session.setAttribute("id", id);
				model.addAttribute("closeT", closeT.getTime());
				model.addAttribute("price", price);
				model.addAttribute("balance", balance);
				
				result = "product/buyBid";
			}else if(now.getTime() >= openT.getTime() && now.getTime() < closeT.getTime()){
				result = "product/openEnd";
			}else {
				result = "product/end";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}