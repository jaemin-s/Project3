package com.music.mrs.user.mapper;

import com.music.mrs.command.UserVO;

public interface IUserMapper {

	// 사용자를 데이터베이스에 추가하는 메서드
    void userinfo(UserVO data);
    
    // 사용자의 정보 보기
    UserVO users(int userNo);
}
