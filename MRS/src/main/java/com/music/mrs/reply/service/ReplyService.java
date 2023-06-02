package com.music.mrs.reply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;
import com.music.mrs.reply.mapper.IReplyMapper;
import com.music.mrs.user.mapper.IUserMapper;

@Service
public class ReplyService implements IReplyService {

	@Autowired
    private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo,String uservo) {
		mapper.replyRegist(vo,uservo);
	}

	@Override
	public List<ReplyVO> getList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub

	}

}
