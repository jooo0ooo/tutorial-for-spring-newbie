package com.joo.tutorial.spring.mapper;

import com.joo.tutorial.bean.AccountInfo;

public interface AccountInfoMapper {
	
	public int getAccountCountByUserSeq(int userSeq);	
	public int insertAccount(AccountInfo account);
	public AccountInfo getAccountInfoByAccountNum(String accountNum);
}