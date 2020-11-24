package com.joo.tutorial.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.BankMoneyBook;
import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.service.AccountInfoService;
import com.joo.tutorial.util.SessionUtil;
import com.joo.tutorial.util.SessionUtil.SESSION_ATTR_KEY;

@Controller
public class HomeController {

	@Autowired
	private AccountInfoService accountInfoService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		
		ModelAndView mav = new ModelAndView("/home");
		
		UserInfo user = SessionUtil.getSession();
		
		if(user != null) {
			
			SessionUtil.setValue(SESSION_ATTR_KEY.USER_INFO, user);
			
			List<AccountInfo> accountList = accountInfoService.getAllAcountNCardInfoByIdNumber(user.getIdNumber());
			mav.addObject("accountList", accountList);
		}
		
		return mav;

	}
	
	@GetMapping("/money/move")
	public ModelAndView moneyMove() {
		ModelAndView mav = new ModelAndView("/money_move");
		
		List<AccountInfo> accountList = accountInfoService.getAllAccountInfoByIdNumber(SessionUtil.getUserIdNumber());
		mav.addObject("accountList", accountList);
		
		return mav;
	}
	
	@PostMapping("/money/move")
	@ResponseBody
	public boolean add(BankMoneyBook data) {
		return accountInfoService.insertBankMoneyBook(data) > 0;
	}
}