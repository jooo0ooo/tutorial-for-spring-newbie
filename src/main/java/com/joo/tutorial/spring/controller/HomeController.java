package com.joo.tutorial.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joo.tutorial.bean.Account;
import com.joo.tutorial.spring.service.AccountService;

@Controller
public class HomeController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		List<Account> list = accountService.getAllData();
		model.addAttribute("id", list.get(1).getId());

		return "home";

	}

}