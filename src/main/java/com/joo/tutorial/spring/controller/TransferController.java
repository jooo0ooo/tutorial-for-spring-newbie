package com.joo.tutorial.spring.controller;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.BankMoneyBook;
import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.enums.TransactionType;
import com.joo.tutorial.spring.service.AccountInfoService;
import com.joo.tutorial.spring.service.UserInfoService;
import com.joo.tutorial.util.SessionUtil;
import com.joo.tutorial.util.SessionUtil.SESSION_ATTR_KEY;

@Controller
@RequestMapping("/transfer")
public class TransferController {

	@Autowired
	private AccountInfoService accountInfoService;
	
	@Autowired
	private UserInfoService userInfoServic;
	
	@GetMapping
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView("/transfer/main");
		
		if (SessionUtil.getSession() == null) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		SessionUtil.removeValue(SESSION_ATTR_KEY.BANK_MONEY_BOOK);
		
		List<AccountInfo> accountList = accountInfoService.getAllAccountInfoByUserSeq(SessionUtil.getUserSeq());
		
		mav.addObject("bankFee", "1,000");
		mav.addObject("max", 1_000_000);
		mav.addObject("accountList", accountList);
		
		return mav;

	}
	
	@PostMapping("/create")
	@ResponseBody
	public boolean create(String accountNum, BigInteger amount) {
		
		BankMoneyBook bmb = new BankMoneyBook();
		bmb.setAccountNum(accountNum);
		bmb.setAmount(amount);
		bmb.setFee(1000);
		bmb.setTransactionType(TransactionType.TRANSFER);
		
		SessionUtil.setValue(SESSION_ATTR_KEY.BANK_MONEY_BOOK, bmb);
		
		return true;
		
	}
	
	@GetMapping("/process")
	public ModelAndView process() {
		
		ModelAndView mav = new ModelAndView("/transfer/process");
		return mav;

	}
	
	@PostMapping("/check")
	@ResponseBody
	public String check(String accountNum) {
		AccountInfo account = accountInfoService.getAccountInfoByAccountNum(accountNum);
		if (account != null) {
			return userInfoServic.getUserInfoByUserSeq(account.getUserSeq()).getName();		
		} else {
			return null;
		}
		
	}
	
	@PostMapping("/process")
	@ResponseBody
	public boolean process(String receiver, String content) {
		BankMoneyBook bmb = (BankMoneyBook) SessionUtil.getValue(SESSION_ATTR_KEY.BANK_MONEY_BOOK);
		bmb.setDepositAccountNum(receiver);
		bmb.setContent(content);
		
		return true;
	}
	
	@PostMapping("/confirm")
	@ResponseBody
	public boolean confirm(String password) {
		return accountInfoService.confirm(password);
	}
	
	@GetMapping("/result")
	public ModelAndView result() {
		ModelAndView mav = new ModelAndView("/transfer/result");
		return mav;
	}
	
	@GetMapping("/history/{accountNum}")
	public ModelAndView history(@PathVariable("accountNum") String accountNum) {
		ModelAndView mav = new ModelAndView("/transfer/history");
		
		if(accountNum != null) {
			mav.addObject("data", accountInfoService.getTransferHistory(accountNum));
		}
		
		return mav;
	}

}