package com.music.mrs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.UserVO;
import com.music.mrs.user.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user")
public class UserinfoController {

	@Autowired
	private final IUserService service;
	
	@Autowired
    public UserinfoController(IUserService service) {
        this.service = service;
    }
	
	@ResponseBody
	@PostMapping("/userinfo")
	public void userinfo(@RequestBody UserVO data) {
		
		log.info(data.getDisplayName());
		log.info(data.getEmail());
		service.userinfo(data);
	}

	@RequestMapping("/include/side")
	public String userDisplyName(@PathVariable int userNo, Model model) {
		model.addAttribute("name", service.users(userNo));
		
		System.out.println(service.users(userNo));
		
		return "side/include";
	}
	
}
