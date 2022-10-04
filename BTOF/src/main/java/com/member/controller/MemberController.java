package com.member.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.member.domain.AccountInfoVO;
import com.member.domain.CashFlowRecordVO;
import com.member.domain.WishListVO;
import com.member.domain.ArtistVO;
import com.member.domain.EnrollProductVO;
import com.member.domain.PrefVO;
import com.member.service.MemberService;
import com.product.domain.Criteria;
import com.product.domain.SellStatusVO;
import com.product.service.ProductService;
import com.common.service.MainService;
import com.member.domain.MemberVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member/")
@Log4j
public class MemberController {
	
	@Autowired MemberService memberService;
	@Autowired ProductService productService;
	
	//선욱님 시작
	@GetMapping("mypage")
	public void mypage(HttpSession session,Model model, MemberVO member) {
		String id = (String) session.getAttribute("memId");
		log.info("세션아이디"+id);
		member.setId(id);
		log.info("세션아이디 +닉 :" + member.getId()+"," + member.getNick() );

		 model.addAttribute("member", memberService.getMypage(id));
	}
	@GetMapping("withdrawal")
	public void withdrawal(HttpSession session,Model model, MemberVO member) {
		String id = (String) session.getAttribute("memId");
		log.info("세션아이디"+id);
		member.setId(id);
		model.addAttribute("member",memberService.getMypage(id));
		
	}
	@PostMapping("delete")
	public String delete(MemberVO member, Model model, HttpServletResponse response ) {
		System.out.println("delete 처리 요청");
		
		int result = memberService.deleteMember(member,response);
		model.addAttribute("result", result);
		
		return "redirect:/member/main"; // main으로 바로 이동
	}
	@GetMapping("tellch")
	public void tellch(Model model,MemberVO member,HttpSession session) {
		String id =(String)session.getAttribute("memId");
		String tell =memberService.getTell(id);
		member.setTell(tell);
		System.out.println("휴대번호 : "+ tell);
		
		 
		
		model.addAttribute("member",member);
	}
	@PostMapping("tellchpro")
	public String tellchpro(Model model,MemberVO member,HttpSession session) {
		String id =(String)session.getAttribute("memId");
		member.setId(id);
		int result = memberService.tellch(member);
		return "member/tellchpro";
	}
	@GetMapping("pwch")
	public void pwch(Model model,MemberVO member,HttpSession session) {
		String id =(String)session.getAttribute("memId");
		
		member.setId(id);
		model.addAttribute("member",member);
		
		
	}
	
	@PostMapping("pwchPro")
	public String pwchPro(HttpSession session,MemberVO member) {
		
		String id =(String)session.getAttribute("memId");
		member.setId(id);
		int result = memberService.pwchg(member);
		session.invalidate();
		
		return "member/mypage";
	}
	@GetMapping("nickch")
	public void NickChage(HttpSession session,Model model, MemberVO member) {
		String id =(String)session.getAttribute("memId");
		String nick =memberService.getNickName(id);
		member.setNick(nick);
		System.out.println("닉네임 : "+ nick);
		
		model.addAttribute("member",member);
		
	}
	@PostMapping("nickchpro")
	public String nickchpro(HttpSession session,MemberVO member, Model model) {
		String id =(String)session.getAttribute("memId");
		member.setId(id);
		
		model.addAttribute("result",memberService.nickch(member));
		return "member/nickchpro";
	}
	
	//css받고다시
	@GetMapping("collection")
	public void collection(HttpSession session ,Criteria cri, Model model) {
		
			String id = (String)session.getAttribute("memId");
						System.out.println("컬렉션의 id입니다------"+id);
				//id = prod_dtl_owner 랑 같은 거 가져오기
			List<SellStatusVO> list= memberService.getOwnPro(id);
									
		
		model.addAttribute("list",list);	
		
		
	}
	@GetMapping("sender")
	public String sender(SellStatusVO vo , RedirectAttributes rttr) {
				String prod_name=vo.getProd_dtl_name();
				String artist = vo.getProd_dtl_artist();
				int prod_number = memberService.getProd_no(prod_name,artist);
		
			return "redirect:/product/sell?prod_no="+prod_number;
	}
	
	
	//나중
	@GetMapping("enrollArtist")
	public void enrollArtist() {
		System.out.println("작가등록폼요청");
	}
	@PostMapping("enrollArtistPro")
	public String enrollArtistPro(ArtistVO vo, MultipartHttpServletRequest request,Model model,HttpSession session) {
			
			String id =(String) session.getAttribute("memId");
				String nick=memberService.getNick(id); // 아이디 주고 닉네임 받아오기
				vo.setArtist_nick(nick);
					
		System.out.println("작가등록프로페이지요청");
		MultipartFile mf = request.getFile("img");
		System.out.println("작가 이름 :"+vo.getArtist_name());
		System.out.println("자기소개 :"+vo.getArtist_introd());
		System.out.println("파일 크기 : "+mf.getSize());
		System.out.println("파일 확장자 :"+mf.getName());
		System.out.println("파일 이름"+mf.getOriginalFilename());
			String fileName=mf.getOriginalFilename();
			vo.setArtist_id(fileName);
			System.out.println("enrollArtist vo  입니다--------"+vo);
		
			int result = memberService.insArtist(vo);
				System.out.println("insArtist 후 result 입니다~---"+result);
				model.addAttribute("result",result);
			
		String savePath=request.getRealPath("resources\\save");
			System.out.println("savePath :"+savePath);
			String orgName= mf.getOriginalFilename();
				UUID uuid =UUID.randomUUID();
				String newName = uuid+orgName;
				String imgPath = savePath +"\\"+newName;
				File f= new File(imgPath);
				try {
					mf.transferTo(f);
				}catch(IOException e) {
					e.printStackTrace();
				}
		return "/member/enrollArtistPro";
	}
	
	
	//나중
	@GetMapping("enrollProduct")
	public void enrollProduct() {
		System.out.println("작품 등록 페이지 요청");
		
	}
	@PostMapping("enrollProductPro")
		public String enrollProductPro(EnrollProductVO enroll,MultipartHttpServletRequest request,HttpSession session,Model model) {		
			MultipartFile mf = request.getFile("file");
				System.out.println("getname 메소드 썼을떄 출력문"+mf.getName());
				System.out.println("getOriginalName 썼을떄 출력문"+mf.getOriginalFilename());
					String fimeName=mf.getOriginalFilename();
					enroll.setProd_file(fimeName);
						String id = (String)session.getAttribute("memId");
					String artist = memberService.getArtist(id);
						enroll.setProd_artist(artist);
						int result = memberService.insProd(enroll);
			System.out.println("파일이름 :"+enroll.getProd_file());
			System.out.println("prod_name :"+enroll.getProd_name());
			System.out.println("cate:"+enroll.getProd_tag());
			System.out.println("pieces :"+enroll.getProd_div());
			System.out.println("price:"+enroll.getProd_price());
			System.out.println("작품소개 :"+enroll.getProd_descr());
						model.addAttribute("result",result);
					
				//int uuid_result =memberService.createUUID(enroll.getProd_name(),enroll.getArtist(),enroll.getPrice(),enroll.getPieces());
					//System.out.println("uuid-result ---------------:"+ uuid_result);
			// UUid는 서비스에서 만들기 
		
			//작가명, 작품명 , 분할 갯수 , 가격 
			return "/member/enrollProductPro";
	}
	
	@GetMapping("userPref")
	public void userPref() {
		System.out.println("userPref 폼 요청");
	}
	@PostMapping("userPref")
	public String userPrefPro(PrefVO pref, RedirectAttributes redirect,HttpSession session) { //취향선택후 로그인페이지로보내기
		String id = (String) session.getAttribute("memId");
			pref.setId(id);
		int result = memberService.insPref(pref);
			redirect.addAttribute("pref_result",result);
				System.out.println("result ------------"+result);
		return "redirect:../common/login";
	}
	
	//합칠준비
		//메인 페이지에서 상품 클릭 후 오는곳이니까 메인페이지에서 세션에 있는 닉네임을 여기로 보내주고 , 고유상품번호 보내줌
		//판매자가 이 페이지를 들어갔을떄는 선택 및 구매 버튼이 아니라 , 판매 취소 버튼이 보여야함
	@GetMapping("product_detail")
	public String product_detail(String nick , int prod_num,Model model) {
		System.out.println("product_detail 요청!");
		int result = -1;
	String prod_Owner = memberService.checkOwner(prod_num);
	// 세션에 있는 닉네임과 , 고유 상품 번호를 보내서 소유자를 꺼내오고 , 쿼리문을 이용해서 상품 고유번호를 주고 소유자를 꺼내오고 , 그 소유자가 닉네임이랑 일치한다면, 판매 취소 버튼이 보이도록
		if(nick.equals(prod_Owner)) {
			result = 2; // 판매 취소 버튼이 보이도록 c:if 조치
		} else {
			result = 1; // 선택 및 구매 버튼이 보이도록 c:if 조치
		}
		model.addAttribute("result",result);
		return "/member/product_detail";
	}
	@GetMapping("enroll_ba")
	public void enroll_ba() {
		System.out.println("계좌등록 폼 요청");
	}
	
	@PostMapping("enroll_baPro") 
	public String enroll_baPro(String pwch,Model model) {
		int result = memberService.checkPw(pwch);
			System.out.println("controller Result : "+result);
			model.addAttribute("result",result);
		// 쿼리문 작성 select count(*) from hbank where acOwner =#{acOwner} and ac_num=#{ac_num}
		return "/member/enroll_baPro";
	}
	@RequestMapping("ajaxBankCheck")
	public ResponseEntity<String> ajaxBankCheck(String Owner , String ac_num){
			System.out.println("acOwenr :"+Owner);
			System.out.println("ac_num :"+ac_num);
			String res = "";
			int result = memberService.checkAccount(Owner , ac_num);
			if(result == 1) {
				res = "사용가능한 계좌입니다";
			}else {
				res ="계좌 정보가 불일치 합니다. 다시 입력해주세요";
			}
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		return new ResponseEntity<String>(res,responseHeader,HttpStatus.OK);
	}
	/////////////////////////////////    HttpSession session  String id = (String)session.getAttribute("memId");
	//충전 session 가져와야함.
	@GetMapping("cashIn")
	public void cashIn(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("memId");
		int balance = memberService.getBalance(id);
		model.addAttribute("id", id);
		model.addAttribute("currentWallet", balance);
		
		
		//계좌 소유자 명, 계좌 은행, 계좌 번호
		AccountInfoVO info = new AccountInfoVO();

		info = memberService.getAccountInfo(id);
		model.addAttribute("accountOwner", info.getAcowner());
		model.addAttribute("accountNum", info.getAc_num());
		model.addAttribute("accountPw", info.getPw());
		
	}


	
	@ResponseBody
	@PostMapping(value = "cashIn")
	public String cashIn(@RequestParam ("amount") int amount, String id, Model model, HttpSession session) throws Exception { //session 아이디 필요
		//은행계좌 있는지 확인
		id = (String)session.getAttribute("memId");
		Integer checkResult = memberService.doYouHaveAccount(id);
		if(checkResult > 0) {
			//String id =	session.getId();
			int wallet = memberService.getBalance(id);
			int addamount = amount+wallet;
			int result = memberService.updateBalance(addamount,id);
			model.addAttribute("result",result);
			
			String r_id = id;
			int deposit = amount;
			memberService.recordCashFlowForDeposit(r_id, deposit);
			
			
			int currentWallet = memberService.getBalance(id);
			model.addAttribute("currentWallet", currentWallet);
		}

		return checkResult.toString(); 	//cashin처리 다음 페이지 필요.
		
		
		//계좌 등록을 해야지 cashin 가능
		//memberService.checkAccount() 사용하여, id가 같은게 table에 있으면 진행 없으면, 없으면 if문으로 계좌 등록페이지 전달.
	}

	@GetMapping("cashOutPro")
	public void cashOutPro() {
	}
	
	//출금
	@GetMapping("cashOut")
	public void cashOut() {
	}

	
	@ResponseBody
	@PostMapping("cashOut")
	public String cashOut(@RequestParam ("amount") int amount, String id, Model model, HttpSession session) throws Exception { //session 아이디 필요
		id = (String)session.getAttribute("memId");
		//은행계좌 있는지 확인
		Integer checkResult = memberService.doYouHaveAccount(id);
		if(checkResult > 0) {
		
		//String id =	session.getId();
		int wallet = memberService.getBalance(id);
		int withdrawal = wallet-amount;
		int balance = memberService.updateBalance(withdrawal,id);
		model.addAttribute("result", balance);
		
		String r_id = id;
		int withdraw = amount;
		memberService.recordCashFlowForWithdrawal(r_id, withdraw);
		
		int currentWallet = memberService.getBalance(id);
		model.addAttribute("currentWallet", currentWallet);
		
		//비밀번호 검사 //이메일검사
		
		//계좌등록을 해야지 cashOut 가능
		}

		return checkResult.toString(); 
	}
	
	
	
	
	//구매
	@GetMapping("buyProduct")
	public void purchase() {}
	
	@PostMapping("buyProduct")
	public String purchase(int prod_no, int buyStock_num, @RequestParam("id") String id, Model model) { //session 아이디 필요
		//String id = session.getId();
		System.out.println("시작");
		int price = memberService.getPrice(prod_no);
		int stock = memberService.getStock(prod_no);
		int wallet = memberService.getBalance(id);
		
		if((wallet-price) > 0) {
			wallet -=price;
			stock -=buyStock_num;
			System.out.println("************************"+wallet);
			System.out.println("************************"+stock);
			
			
			int result1 = memberService.deductStock(stock, prod_no);
			int result2 = memberService.updateBalance(wallet, id);
			model.addAttribute("result1", result1);
			System.out.println("************************"+result1);
			model.addAttribute("result2", result2);
			System.out.println("************************"+result2);
			

			
		}
		int currentWallet = wallet;
		model.addAttribute("currentWallet", currentWallet);
		return "/member/buyProductPro"; 
		
		//비밀번호 검사, 이메일 확인
		
		
	}
	@GetMapping("buyProductPro")
	public void buyProductPro() {}

	
	

	//좋아요 넣기
	@GetMapping("rank_likes")
	public void likePage(Model model, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		model.addAttribute("id", id);
		model.addAttribute("num", 3);
		
		
	}
	
	// 좋아요 처리 
	@ResponseBody
	@PostMapping(value="rank_likes")
	public String EnactLike(@RequestParam("prod_no") int prod_no, String id, Model model, HttpSession session) {
		id = (String)session.getAttribute("memId");
		Integer res = memberService.updateLike(id, prod_no); // 1 = 하트 끄기, 0 = 하트켜기 
		/*
		Integer result = memberService.checkLike(id, prod_no); //userLike 테이블에서 값 가져오기 like 값을 가져오기
		int res = 0;
		if(result != 1) {
			memberService.insertLikeToUser(id, prod_no); //userLike 테이블에서 값 넣기
			memberService.insertLikeToProduct(prod_no); //product 테이블에 값 넣기
			System.out.println("**************************************************" + "값 넣기 성공");
			res = 1;
		} else {
			memberService.deleteLike(id, prod_no);
			res = 0;
			System.out.println("**************************************************" + "값 빼기 성공");

		}
		*/
		
		//HttpHeaders responseHeader = new HttpHeaders();
		//responseHeader.add("Content-Type","text/html;charset=utf-8");
		//return new ResponseEntity<Integer>(res,responseHeader,HttpStatus.OK);
		return res.toString();
	}
	

	@GetMapping("cashFlowRecord")
	public void showRecord(Model model, String id, HttpSession session) {
		id = (String)session.getAttribute("memId");
		int num= 1;
		List<CashFlowRecordVO> balance = memberService.showRecordForCashFlow(id, num);
		model.addAttribute("recordList", balance);
	}

	@GetMapping(value="cashFlowRecord2", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CashFlowRecordVO>> showRecordForCashFlow(String id, Integer num, Model model, HttpSession session) {
		id = (String)session.getAttribute("memId");	
		System.out.println("**********************************" + id + num);
		List<CashFlowRecordVO> recordList = memberService.showRecordForCashFlow(id, num);
		System.out.println("**********************************" +recordList);
		System.out.println("*******************************" + recordList + "가져오기 성공!!");
		model.addAttribute("recordList", recordList);
		
		
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-Type","text/html;charset=utf-8");
		return new ResponseEntity<>(recordList, HttpStatus.OK);
	} 
	
	//HttpSession session  String id = (String)session.getAttribute("memId");	
	@GetMapping("likePage")
	public void getLikePage(String id, Model model, HttpSession session) {
		id = (String)session.getAttribute("memId");
		List<WishListVO> wishList = memberService.getMyWishList(id);
		model.addAttribute("getMyWishList", wishList);
	}
	
	
	
	
	
	
	
	
}