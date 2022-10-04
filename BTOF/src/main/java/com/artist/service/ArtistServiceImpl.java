package com.artist.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artist.domain.ArtistVO;
import com.artist.mapper.ArtistMapper;

@Service
public class ArtistServiceImpl implements ArtistService{

	@Autowired
	private ArtistMapper artistMapper;
	
	@Override
	public List<ArtistVO> getRankList() {
		return artistMapper.getRankList();
	}

	@Override
	public List<ArtistVO> getListByStartDay() {
		return artistMapper.getListByStartDay();
	}

	@Override
	public Integer LikesPerArtist(String artist_name) {
		return artistMapper.LikesPerArtist(artist_name);
	}

	@Override
	public List<ArtistVO> getArtistInfo(String id) {
		return artistMapper.getArtistInfo(id);
	}

	@Override
	public List<ArtistVO> getRankListByLikes() {
		return artistMapper.getRankListByLikes();
	}

}
