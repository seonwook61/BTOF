package com.artist.controller;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.artist.domain.ArtistVO;
import com.artist.service.ArtistService;
import com.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/artist/*")
@Log4j
public class ArtistController {

	
	@Autowired
	private ArtistService artistService;
	@Autowired MemberService memberService;
	
	@GetMapping("artistRanking")
	public void getArtistRanking(Model model, HttpSession session) { 
		System.out.println("**************************artistRanking");
		String id = (String)session.getAttribute("memId");
		List<ArtistVO> artistRankList = artistService.getRankList();
		List<ArtistVO> artistListByStartDay = artistService.getListByStartDay();
		
		List<Integer> prod_no_list1 = artistRankList.stream().map(vo -> vo.getProd_no()).collect(Collectors.toList());
		List<Integer> artistRankListLikes = new ArrayList<Integer>(); 
		for(int no : prod_no_list1) {
			artistRankListLikes.add(memberService.getLikes(id, no));
		}
		
		List<Integer> prod_no_list3 = artistListByStartDay.stream().map(vo -> vo.getProd_no()).collect(Collectors.toList());
		List<Integer> artistListByStartDayLikes = new ArrayList<Integer>(); 
		for(int no : prod_no_list3) {
			artistListByStartDayLikes.add(memberService.getLikes(id, no));
		}
		System.out.println("**************************artistListByStartDayLikes");
		System.out.println(artistListByStartDay);
		System.out.println(prod_no_list3);
		System.out.println(artistListByStartDayLikes);
		
		model.addAttribute("artistRankList", artistRankList);
		model.addAttribute("artistRankListLikes", artistRankListLikes);
		
		model.addAttribute("artistListByStartDay", artistListByStartDay);
		model.addAttribute("artistListByStartDayLikes", artistListByStartDayLikes);
		// 리스트
		
		
		List<ArtistVO> prod_no2 = artistService.getRankList();
		
		
		//좋아요 별 리스트 **별도 좋아모음 테이블 필요
		//전체 작가 리스트
		Long artist_name_total = artistService.getRankList().stream().
				map(ArtistVO::getArtist_name).count();
		
		System.out.println("*****************************" + artist_name_total);
		model.addAttribute("RankingNum", artist_name_total);
		
		Long product_total = artistService.getRankListByLikes().stream().count();
		model.addAttribute("RankingNumByLikes", product_total);
		
		
		/*
		Map<String, Integer> likeList = new HashMap<String, Integer>();
		artist_name_total.forEach(
				artist_name -> likeList.put(artist_name, artistService.LikesPerArtist(artist_name)));
				*/
	}
	
	/*
	@GetMapping("artistPage")
	public void getArtistPage(Model model) {
	}
	*/
	@GetMapping("artistPage")
	public String getArtistPage(String artist_name, Model model) {
		//id = "artist2";
		
		List<ArtistVO> artistInfo = artistService.getArtistInfo(artist_name);
		model.addAttribute("artistInfo", artistInfo);
		//model.addAttribute("id", id);
		//작품클릭시 해당 아티스트 이름 가져와서 띄어주기.
		model.addAttribute("artist_name",artist_name);
		
		return "artist/artistPage";
	}
	
	
	
	
	
	
}
