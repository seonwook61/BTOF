package com.artist.service;

import java.util.List;


import com.artist.domain.ArtistVO;

public interface ArtistService {

	public List<ArtistVO> getRankList();

	public List<ArtistVO> getListByStartDay();

	public Integer LikesPerArtist(String artist_name);

	public List<ArtistVO> getArtistInfo(String id);

	public List<ArtistVO> getRankListByLikes();

}
