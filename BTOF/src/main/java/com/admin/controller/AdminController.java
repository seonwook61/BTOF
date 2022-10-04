package com.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.admin.domain.Criteria;
import com.admin.domain.PageDTO;
import com.admin.domain.ProductVO;
import com.admin.service.AdminService;
import com.board.domain.InquiryVO;
import com.member.controller.MemberController;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;



	@GetMapping("main")
	public void main(Integer login_res, Integer inq_result, Model model) {
		model.addAttribute("inq_result",inq_result);
		model.addAttribute("login_res", login_res);
		System.out.println("admin 메인 페이지 요청");
	}
	
	
	@GetMapping("Approval")
	public void Approval(HttpServletRequest request, Criteria cri, Model model) {
		model.addAttribute("list", adminService.getList(cri));   

	}
	
	@GetMapping("ready")
	public void ready(@RequestParam("prod_no") int prod_no, @ModelAttribute("cri")Criteria cri, Model model,HttpSession session) {
		
			model.addAttribute("product", adminService.get(prod_no));
	}
	
	//승인처리
	@PostMapping("readyPro")
	public String readyPro(ProductVO product, HttpSession session,Model model,RedirectAttributes rttr) {
			int prod_number = product.getProd_no(); // 상품 번호 저장하고
		model.addAttribute("product",adminService.updatePass(product)); //업데이트 쿼리문 날려주고
		// 제품 번호가 넘어 오니까 제품 번호를 통해서 작품명이랑 작가명 가격 분할갯수
			product = adminService.bringPro(product);
				String prod_dtl_name = product.getProd_name(); // 작품명
				String prod_dtl_artist = product.getProd_artist(); //작가명
				long price = product.getProd_price(); //가격
				int pieces = product.getProd_div(); // 분할갯수
			System.out.println("product");
			int uuid_res = adminService.createUUID(prod_dtl_name,prod_dtl_artist,price,pieces); // 작품명이랑 작가명 가격 분할갯수
				rttr.addAttribute("uuid_res",uuid_res);
		return "redirect:/admin/Approval";
	}
	
	//거부처리
	@PostMapping("readyPro2")
	public String readyPro2(ProductVO product, HttpSession session, Model model) {
		int result = adminService.updateRefues(product)+adminService.deleteRefues(product);
		model.addAttribute("product",result);
		
		return "redirect:/admin/Approval";
	}

	@GetMapping("Manage")
	public void manage(Model model) {
		System.out.println("manage 폼 요청");
		InquiryVO vo = new InquiryVO();
			
		List<InquiryVO> list = adminService.getInqList();
		
		model.addAttribute("list",list);
		
	}
	@GetMapping("reply")
	
	public void reply(InquiryVO vo, Model model) {
		
			vo = adminService.getInq(vo);
			
			model.addAttribute("list",vo);
		
	}
	@PostMapping("replyPro")
	
	public String replyPro(InquiryVO vo, RedirectAttributes redirect) {
			
			// 답변 넘어옴
			Integer inq_result = adminService.updateInq(vo);
			redirect.addAttribute("inq_result",inq_result);
			int result = 1;
				redirect.addAttribute("login_res",result);
		return "redirect:/admin/main";
		
	}
	
	
	@GetMapping("Ordership")
	public void Ordership() {
		
	}

	
	@GetMapping("Balance")
	public void Balance() {
		
	}

	
	@GetMapping("paymentHistory")
	public void paymentHistory() {
		// history 테이블 전부 최신순으로 desc 해서 가져오고 리스트에 담아서 , 모델로 던져주기
		System.out.println("payment 폼 요청!");
	}
}
