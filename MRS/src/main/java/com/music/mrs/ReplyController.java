package com.music.mrs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.reply.service.IReplyService;

@RestController
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	//댓글 등록
	@PostMapping("/regist")
	public String replyRegist(@RequestBody ReplyVO vo){
		service.replyRegist(vo);
		return "regSuccess";
	}
	
	
	
}