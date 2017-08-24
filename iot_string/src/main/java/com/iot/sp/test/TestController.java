package com.iot.sp.test;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/list")
	public String user(HttpServletRequest request,Model map){
		return "test/list";
	}

	@RequestMapping("/write")
	public String modify(HttpServletRequest request,Model map){
		return "test/write";
	}
	@RequestMapping("/modify")
	public String test2(HttpServletRequest request,Model map){
		return "test/modify";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,Model map){
		return "test/delete";
	}
}
