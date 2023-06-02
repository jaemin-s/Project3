package com.music.mrs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;
import com.music.mrs.reply.service.IReplyService;

/*CREATE TABLE reply (
		   rno INT PRIMARY KEY AUTO_INCREMENT,
		   wrno INT,
		   reply_content VARCHAR(3000) NOT NULL,
		   reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		   FOREIGN KEY (wrno) REFERENCES users (users_id) ON DELETE CASCADE
		);

		CREATE TABLE play(
			playno INT PRIMARY KEY AUTO_INCREMENT,
		    playid VARCHAR(250) NOT NULL 
		);*/



@RestController
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	
	
	//댓글 등록
	@PostMapping("/regist")
	public String replyRegist(@RequestBody ReplyVO vo){
		
		UserVO uservo = new UserVO();
	
		System.out.println(vo.getReplyContent());
		service.replyRegist(vo, uservo.getEmail());
		return "Success";
	}
	
	
	
}
