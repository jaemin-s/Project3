package com.music.mrs.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.mrs.command.UserVO;
import com.music.mrs.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired
    private IUserMapper mapper;
	
	@Override
	public void insert(UserVO data) {
		
		mapper.insert(data);
	}

}
