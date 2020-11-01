package com.joo.tutorial.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joo.tutorial.bean.Account;
import com.joo.tutorial.spring.mapper.AccountMapper;

@Service
public class AccountService {

	@Autowired
	private AccountMapper accountMapper;
	
	public List<Account> getAllData() {
		return accountMapper.getAllData();
	}

}