package com.music.mrs;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;
import com.music.mrs.reply.service.IReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	// 댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ReplyVO vo){
		UserVO uvo = new UserVO();
		service.replyRegist(vo);
				
		if(vo.getReplyId().equals(uvo.getDisplayName())) {
			System.out.println("vo:"+vo);
			return "regSuccess";
			
		} else {
			return "regBad";
		}
	}
	
	// 목록
	@GetMapping("/replyList")
	public String reList() {
		
		return null;
	}
	
	// 댓글 업데이트
	@PostMapping("/update")
	public String rUpdate(@PathVariable int replyNo,@RequestBody ReplyVO rvo) {
		UserVO uvo = new UserVO();
		
		rvo.setReplyNo(replyNo);
		
		if(rvo.getUserId() == uvo.getUserNo()) {
			service.update(rvo);
			return null;
		} else {			
			return null;
		}
	}
	
	// 댓글 삭제
	@PostMapping("/delete")
	public String rDelete(@PathVariable int replyNo,@RequestBody ReplyVO rvo){
		UserVO uvo = new UserVO();
		
		rvo.setReplyNo(replyNo);
		
		if(rvo.getUserId() == uvo.getUserNo()) {
			service.delete(replyNo);
			return null;
		} else {			
			return null;
		}
		
	}
	
	
}
