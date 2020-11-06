package com.joo.tutorial.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.util.SessionUtil;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		model.addAttribute("id", "joo");
		
		if (SessionUtil.isLogin()) {
			model.addAttribute("isLogin", true);
		} else {
			model.addAttribute("isLogin", true);
		}
		
		UserInfo user = SessionUtil.getSession();
		
		if(user != null) {
			System.out.println(SessionUtil.getSession().toString());
		} else {
			System.out.println("null user");
		}
		

		return "home";

	}

}