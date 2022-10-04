package com.common.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.common.domain.AttendVO;
import com.common.domain.Criteria;
import com.common.domain.MainVO;
import com.common.domain.PageDTO;
import com.common.domain.SignupVO;
import com.common.mapper.MainMapper;
import com.common.service.MainService;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private MainMapper mainMapper;
	
	/*
	//일정보기
			@RequestMapping(value = "/calendars", method = RequestMethod.GET)
			public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
				String viewpage = "calendar";
				List<Calendar> calendar = null;
				try {
					calendar = mainService.getCalendar();
					request.setAttribute("calendarList", calendar);
				} catch (Exception e) {
					e.printStackTrace();
				}
				mv.setViewName(viewpage);
				return mv;
			}
	*/
	
	/*
	@RequestMapping(value = "/common/calendar", method = RequestMethod.GET)
	public ModelAndView  calendar(HttpServletRequest request, AttendVO attendVO ,Model model) {
		
		AttendVO list =mainMapper.Attendance(attendVO.getATT_ID());
		
		
		Calendar cal = pointMapper.getCalendarByDate(userId);
		boolean isCheck = cal.getCreateAt() != Timestamp.valueOf(LocalDateTime.now()) ? true : false;
		mv.addObject("isCheck", isCheck);
		return mv;
		
		return mv;
		
	}
	*/
	
	@RequestMapping(value = "attendances", method = RequestMethod.GET)
	@ResponseBody
	  public List<Calendar> getCalendarList(HttpServletRequest request) {
			log.info("gogo");
			String userId = "이만기";
			List<Calendar> calList = mainMapper.getCalendarList(userId);
			
			
			return calList;
			
		}
	
	@RequestMapping(value = "attendances")
	@ResponseBody
		public ResponseEntity<String> clickCalendar(@RequestParam(value="userId" , required = false) String userId) {
		 	System.out.println("userId : "+userId);
		 	String resStr = "";
		 	
		 	int result = mainMapper.Poincheck(userId);
		 	//
		 	
		 // 헤더 정보 추가 . 응답해더
			HttpHeaders responseHeader = new HttpHeaders();
			responseHeader.add("Content-Type","text/html;charset=utf-8");
			
			return new ResponseEntity<String>(resStr,responseHeader, HttpStatus.OK);
			
	}
	
	
	@GetMapping("check")
	public void check() {
		
	}
	
	@GetMapping("market")
	public void main(Model model, Integer pord_no) {
		model.addAttribute("list",mainService.showList());
		
//		List<MainVO> list = mainMapper.showList();		

	}
	
	@GetMapping("main")
	public void main(Integer login_res,HttpSession session, Model model) {
		String stat = (String) session.getAttribute("memId");
		model.addAttribute("login_res",login_res);
		int result=-1;
		if(stat==null) {
			result=0;
		}else if(stat!=null) {
			String nick = mainService.getOwnWithId(stat);
			model.addAttribute("nick", nick);
			result=1;
		}
		model.addAttribute("stat", result);
		
	}
	
	/* 상품 검색 */
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		log.info("cri" + cri);
		
		List<MainVO> list = mainService.getGoodsList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "common/search";
		}
		
		//model.addAttribute("pageMaker", new PageDTO(cri, mainService.goodsGetTotal(cri)));
		
		
		return "common/search";
		
	}
	
	@GetMapping("uploadForm")
	public void uploadForm() {
		System.out.println("upload form 요청 ");
	}
	
	@GetMapping("uploadPro")
	public void uploadPro() {
		System.out.println("pro요청");
	}
	
	@PostMapping("uploadPro")
	public String uploadPro(String msg, MultipartHttpServletRequest request, Model model) {
		
		// #1. 넘어온 파일 정보 꺼내기 
		System.out.println("msg : " + msg);
		MultipartFile mf = request.getFile("img"); 
		System.out.println("mf size : " + mf.getSize());
		System.out.println("mf orgName : " + mf.getOriginalFilename());
		System.out.println("mf contentType : " + mf.getContentType());
		
		String ct = mf.getContentType();
		String type = ct.substring(0, ct.indexOf("/")); 
		if(!type.equals("image")) { // 이미지가 아니면 저장 하지말자.
			System.out.println("이미지파일 아닙니다.");
			return "redirect:/common/uploadForm"; // 저장하지말고 폼페이지로 강제 이동 
		}
		
		//D:\gangsa\spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\member\resources
		// 서버에 파일 저장 
		// #2. 파일 저장할 폴더 경로 찾아 (save) 
		String savePath = request.getRealPath("resources\\save");
		System.out.println(savePath);
		// #3. 파일 이름 (원본파일 이름을 저장할것인가 no, 파일이름 중복처리해서 서버에저장) 
		/* #3-1. 오리지날파일명 + 현재시간millis + 확장명 
		String orgName = mf.getOriginalFilename(); 
		String ext = orgName.substring(orgName.lastIndexOf(".")); 
		String imgName = orgName.substring(0, orgName.lastIndexOf("."));
		System.out.println("ext : " + ext);
		System.out.println("imgName : " + imgName);
		String newName = imgName + System.currentTimeMillis() + ext; 
		System.out.println("newName : " + newName);
		*/
		// #3-2. UUID + orgName 
		String orgName = mf.getOriginalFilename(); 		
		UUID uuid = UUID.randomUUID(); 
		String newName = uuid+orgName; 
		
		// #4. 파일을 실제로 저장 처리 
		//	: 내가만든 파일명과 폴더 전체경로를 연결해서 그쪽으로 파일을 이동 개념  
		String imgPath = savePath + "\\" + newName; 
		File f = new File(imgPath); 
		try {
			mf.transferTo(f);
		}catch(IOException e) {
			e.printStackTrace();
		} 
		
		// (#5.) DB에 파일이름저장 : newName
		
		// view에 파일명 전달해서 pro페이지에 img로 띄우기
		// (사용자가 브라우저에서 내가 업로드한 이미지 보기)
		model.addAttribute("imgName", newName);
		
		return "common/uploadPro";
	}
	

}
