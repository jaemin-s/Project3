package com.music.mrs;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.rcmd.service.IRcmdService;

@Controller
@RequestMapping("/rcmd")
public class RcmdController {
	
	@Autowired
	private IRcmdService service;
	
	@GetMapping("/spotifyTest")
	private void spotifyTest(Model model, HttpSession session) {
		String token = service.getToken();
		session.setAttribute("spotifyToken", token);
	}

}
