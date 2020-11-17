package com.joo.tutorial.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.service.AccountInfoService;
import com.joo.tutorial.spring.service.UserInfoService;
import com.joo.tutorial.util.SessionUtil;

@Controller
@RequestMapping("/account")
public class AccountInfoController {
	
	@Autowired
	UserInfoService userInfoService;
	
	@Autowired
	AccountInfoService accountInfoService;
	
	@PostMapping("/check")
	@ResponseBody
	public boolean checkAccountNum(String accountNum) {
		
		if (accountNum != null) {
			return accountInfoService.isExistAccountNum(accountNum);
		}
		
		return false;
	}
	
	@PostMapping("/create")
	@ResponseBody
	public boolean create(AccountInfo account) {
		
		if ("RANDOM".equals(account.getAccountNum())) {
			account.setAccountNum(null);
		}
		
		account.setUserSeq(SessionUtil.getUserSeq());
		
		return accountInfoService.makeAccount(account) != null ? true : null;
		
	}
	
}