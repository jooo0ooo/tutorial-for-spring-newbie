package com.joo.tutorial.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	UserInfoService userInfoService;
	
	@RequestMapping(value = "/user/login")
	public void loginPage(String error, String logout, Model model) {
		
		if(error != null) { 
			model.addAttribute("error","로그인 실패"); 
		} 
		if(logout != null) { 
			model.addAttribute("logout","로그아웃"); 
		}
		
		System.out.println(error);
		System.out.println(logout);
		System.out.println("??????????????????????????????");
		
	}
	
	@PostMapping("/user/login-processing")
	public void loginProcessing(String error) {
		System.out.println("????????????????????????");
		System.out.println(error);
	}
	
	
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