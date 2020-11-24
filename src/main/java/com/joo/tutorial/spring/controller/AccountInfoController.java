package com.joo.tutorial.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.CardInfo;
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
		
		account.setIdNumber(SessionUtil.getUserIdNumber());
		
		return accountInfoService.makeAccount(account) != null ? true : null;
		
	}
	
	@PostMapping("/update")
	@ResponseBody
	public boolean update(String alias, String accountNum) {
		return accountInfoService.updateAccount(alias, accountNum);
	}
	
	@PostMapping("/create/card")
	@ResponseBody
	public String createCard(String accountNum) {
		
		CardInfo card = accountInfoService.getCardInfoByAccountNum(accountNum);
		Gson gson = new Gson();
		
		if (card != null) {
			return gson.toJson(card);
		} else {
			CardInfo newCard = accountInfoService.makeCard(accountNum);
			return gson.toJson(newCard);
		}
		
	}
}