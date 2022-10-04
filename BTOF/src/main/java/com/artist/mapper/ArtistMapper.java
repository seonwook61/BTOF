package com.artist.mapper;

import java.util.List;

import com.artist.domain.ArtistVO;

public interface ArtistMapper {

	public List<ArtistVO> getRankList();

	public List<ArtistVO> getListByStartDay();

	public Integer LikesPerArtist(String artist_name);

	public List<ArtistVO> getArtistInfo(String id);

	public List<ArtistVO> getRankListByLikes();

}
