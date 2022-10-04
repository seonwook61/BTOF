package com.common.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.service.CommonService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/test/")
public class testController {

		@Autowired
		CommonService commonService;
	
	@GetMapping("signup2")
	public void signup() {
		System.out.println("signup 폼 요청 ");
	}
	
	@GetMapping("auc_form")
	public void auc_form() {
		System.out.println("auction 폼 요청!");
	}
	
	@PostMapping("auction")
	public String auction(@Param("id") String id, @Param("prod_name") String prod_name, @Param("price") int price,Model model) {
			// int balance = commonService.getBalance(id);
		// if(balance <price){
				//result == 2 ;
	//}
		System.out.println(id);
		System.out.println(prod_name);
		System.out.println(price);
		int result = -1;
		int balance = commonService.getBalance(id);
		int highprice = commonService.getprice(prod_name); // 상품명을 줄테니 가격을 돌려줘
			
		if(balance<price) {
				//보유잔액이 입력받은 입찰 희망가보다 적은경우 
			result = 2;
		}else if(price > highprice) {
				//입찰 희망가가 현재 최고 입찰가보다 큰 경우 (입찰 성공!)
			result = commonService.renewprice(prod_name,price,id);
		}else {
			result = 0;
			// 입찰 희망가가 현재 최고 입찰가보다 작은 경우 
		}
		model.addAttribute("result",result);
		return "/test/auction";
	}
	
	@RequestMapping("ajaxPrice")
	public ResponseEntity<String> ajaxPrice(String id,@Param("prod_name") String prod_name,@Param("price") int price){
		System.out.println("ajaxprice 요청"+price);
		int highprice = commonService.getprice(prod_name); 
		int result = -1;
		String fin = "가능?불가능";
		if(price > highprice) {
			 commonService.renewprice(prod_name,price,id);
			fin ="입찰 성공";
		}else {
				fin="입찰 실패";
				
		}
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		return new ResponseEntity<String>(fin,responseHeader,HttpStatus.OK);
	}
	@RequestMapping("test")
	public String request_test(@RequestParam ("id") String id, @RequestParam("pw") String pw, Model model) {
			System.out.println("테스트폼 요청!");
			System.out.println(id);
			System.out.println(pw);
			int result= -1;
			if(!(id.equals(null))) {
				result = 1;
				model.addAttribute("result",result);
				return "/test/test";
			}else if(id.equals(null)) {
				return "/test/test";
			}
			return "/test/test";
			// return 으로 메인 보내지말고 redirect 메서드를 이요해서 보내기 
	}
}
