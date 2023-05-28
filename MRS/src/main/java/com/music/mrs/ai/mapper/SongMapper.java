package com.music.mrs.ai.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.music.mrs.ai.command.SongVO;

@Repository
public class SongMapper implements ISongMapper {
	

   
    @Override
    public void saveSong(SongVO song) {
        // 새로운 값 저장하는 로직을 구현
        // 예를 들어, 데이터베이스 삽입 쿼리 실행 등의 작업을 수행
    }
    
}