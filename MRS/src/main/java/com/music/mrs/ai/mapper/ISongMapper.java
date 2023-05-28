package com.music.mrs.ai.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.music.mrs.ai.command.SongVO;

@Mapper
public interface ISongMapper {
	
	// 중복 체크를 위한 메소드

    void saveSong(@Param("song") SongVO song);
    
}