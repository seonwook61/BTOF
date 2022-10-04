package com.common.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.common.domain.DisplayDTO;
import com.common.domain.SignupVO;
import com.common.service.CommonService;
import com.member.service.MemberService;
import com.product.domain.Criteria;
import com.product.domain.PageDTO;
import com.product.service.ProductService;

import oracle.jdbc.proxy.annotation.Post;


@Controller
@RequestMapping("/common/")
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("signup")
	public void signup() {
		
		System.out.println("signup form 요청");
	}
		
	
	@PostMapping("signup")
	public String signupPro(@ModelAttribute("member") SignupVO member, Model model) {
		System.out.println("signupPro 요청!");
		int result = commonService.register(member);
		
					//commonService.registersinBirth(member);
		model.addAttribute("result",result);
		return "redirect:../member/userPref";
	}
	
	@RequestMapping("idAvail")
	public String idAvail(String id, Model model) {
		System.out.println("id 중복확인 요청");
		System.out.println(id);
		int result = commonService.idAvail(id);
		model.addAttribute("result",result);
		model.addAttribute("trialId",id);
		// result == 1 : DB에 이미 존재함. 중복
		// result == 0 : 사용가능
		return "common/idAvail";
	}	
	
	@RequestMapping("ajaxIdAvail")
	public ResponseEntity<String> ajaxIdAvail(String id) {
		System.out.println("ajaxIdAvail 요청 : " + id);
		int result = commonService.idAvail(id);
		String resStr = "";
		if(result == 1) {
			resStr = "중복 not available";
		}else {
			resStr = "가능 available";
		}
		
		// 헤더 정보 추가 . 응답해더
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		
		return new ResponseEntity<String>(resStr,responseHeader, HttpStatus.OK);
	}
	
	
	@GetMapping("NickAvail")
	public String nickAvail(String nick, Model model)  {
	  int result = commonService.NickAvail(nick);
	  	System.out.println("nickname 중복확인 요청");
	  	model.addAttribute("result",result);
	  	model.addAttribute("trialNick",nick);
	  return "common/NickAvail";
	}
	
	@RequestMapping("ajaxNickAvail")
	public ResponseEntity<String> ajaxNickAvail(String nick) {
		System.out.println("ajaxNickAvail 요청 : " + nick);
		int result = commonService.NickAvail(nick);
		String resStr = "";
		if(result == 1) {
			resStr = "중복 not available";
		}else {
			resStr = "가능 available";
		}
		
		// 헤더 정보 추가 . 응답해더
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		
		return new ResponseEntity<String>(resStr,responseHeader, HttpStatus.OK);
	}
	
	@GetMapping("NickAvail2")
	public String ref_nickAvail(String nick2, Model model)  {
	  int result = commonService.NickAvail(nick2);
	  	System.out.println("추천인 유무확인 요청");
	  	model.addAttribute("result",result);
	  	model.addAttribute("trialNick2",nick2);
	  return "common/NickAvail2";
	}
	
	@RequestMapping("ajaxNickAvail2")
	public ResponseEntity<String> ref_ajaxNickAvail(String nick2) {
		System.out.println("ajaxNickAvail 요청 : " + nick2);
		int result = commonService.NickAvail(nick2);
		String resStr = "";
		if(result == 1) {
			resStr = "중복 not available";
		}else {
			resStr = "가능 available";
		}
		
		// 헤더 정보 추가 . 응답해더
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		
		return new ResponseEntity<String>(resStr, responseHeader, HttpStatus.OK);
	}
	
	@GetMapping("login")
	public void login() {
		
		System.out.println("로그인폼 요청");
		
	}
		
	@PostMapping("login")
	public String loginPro(String id , String pw,Model model,RedirectAttributes redirect, HttpSession session, HttpServletResponse response) {
		Integer result = commonService.login(id, pw, response);
		redirect.addAttribute("login_common",result);
		model.addAttribute("id",id);
		session.getAttribute("memId");
			System.out.println("로그인후 세션에 저장된아이디 입니다."+session.getAttribute("memId"));
		String power = commonService.getUserPower(id); // 아티스트인지 , 관리자 인지 구별하기 위해서
			System.out.println("power입니다-------"+power);
			if(power.equals("M")) {
				redirect.addAttribute("login_res",result); // 1을 보내서 
				return "redirect:/admin/main";
			}
		String nick=memberService.getNick(id); // 아이디 주고 닉네임 받아오기
			
		String artist_pass =  commonService.getPass(nick); // 닉네임 줄테니까 , 아티스트 패스 가져와 
			if(artist_pass== null) {
				return "redirect:/common/main";
			}else if(artist_pass.equals("D")) {
					redirect.addAttribute("artist_pass",artist_pass);// 이거 받아서 승인 거절 되었으니까 다시 작가 신청 하라고 alert 띄우고 
					// delete from artist where nick=#{nick}
				commonService.deleteAp(nick); // 만약 승인 거절 당했으면 컬럼 삭제 하기
					return "redirect:/common/main";
			}
			//session.getId();
			return "redirect:/common/main";
			
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memId");
		return "redirect:/common/main";
	}
	
	@GetMapping("findID")
	public void findID() {
		System.out.println("아이디 찾기 폼 요청");
		
		
	}
	
	@PostMapping("findIDpro")
	public String findIDpro(@RequestParam("nick")String nick , @RequestParam("tel") String tel,Model model) {
			System.out.println(nick);
			System.out.println(tel);
			int result =commonService.idFind(nick,tel);
			System.out.println("result :" + result);
			if(result ==1) {
		String id= commonService.idCheck(nick,tel);
		model.addAttribute("nick",nick);
		model.addAttribute("tel",tel);
		model.addAttribute("id",id);
		model.addAttribute("result",result);
			return "/common/findIDpro";
			} else {
					model.addAttribute("result",result);
				return "common/findIDpro";
			}		
		
	}
	@GetMapping("findPw")
	
	public void findPW() {
		System.out.println("비밀번호 찾기 폼 요청");
	}
	
	@PostMapping("findPwpro")
	public String findPWpro(@Param("id") String id , @Param("tel") String tel, Model model) {
		
			int result = commonService.pwCheck(id,tel);
			if(result==1) { // id , tel 일치하면 비밀번호 변경 페이지로 이동
				return "/member/pwch";
			}else { // 틀리면 비밀번호 찾기 페이지로 이동
					model.addAttribute("result", result);
				return "common/findPwpro";
			}
	}
	
	@GetMapping("prod_detail")
	public void detail() {
			System.out.println("상품 상세 폼 요청! ");
	}
	@GetMapping("login_google")
	public void login_google() {
		System.out.println("구글 로그인 폼 요청");
	}
	@GetMapping("login_kakao")
	public void login_kakao() {
		System.out.println("카카오 로그인 폼 요청");
	}
	
	@GetMapping("marketplace")
	public void marketplace(HttpServletRequest request, Criteria cri, Model model) {
		model.addAttribute("list", productService.getList(cri));
		int total = productService.getTotal(cri); 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		//model.addAttribute("cate", request.getParameter("prod_tag"));
		
	}
	
}
	
	
