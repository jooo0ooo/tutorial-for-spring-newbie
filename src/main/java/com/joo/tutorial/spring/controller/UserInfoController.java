package com.joo.tutorial.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	UserInfoService userInfoService;
	
	@GetMapping("/user/login")
	public void loginPage(String error, String logout, Model model) {
		
		if(error != null) { 
			model.addAttribute("error","로그인 실패"); 
		} 
		if(logout != null) { 
			model.addAttribute("logout","로그아웃"); 
		}
		
	}
	
	/*
	@PostMapping("/user/login-processing")
	public void loginProcessing(String error) {
		
	}
	*/
	
	@GetMapping("/user/register")
	public String register() {
		return "/user/register";
	}
	
	@PostMapping("/user/register")
	public String registerProcess(UserInfo users) {
		
		if (userInfoService.register(users)) {
			return "redirect:/user/login";
		}
		
		return "redirect:/user/register";
		
	}
	
}