package com.joo.tutorial.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.service.AccountInfoService;
import com.joo.tutorial.util.SessionUtil;

@Controller
public class HomeController {

	@Autowired
	private AccountInfoService accountInfoService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		
		ModelAndView mav = new ModelAndView("/home");
		
		UserInfo user = SessionUtil.getSession();
		
		if(user != null) {
			List<AccountInfo> accountList = accountInfoService.getAllAcountInfoByUserSeq(user.getSeq());
			mav.addObject("accountList", accountList);
		}
		
		
		return mav;

	}

}