package com.music.mrs.reply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.reply.mapper.IReplyMapper;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> replyList(Map<String, Object> data) {
		return null;
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}
