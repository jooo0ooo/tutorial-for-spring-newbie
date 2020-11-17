package com.joo.tutorial.spring.mapper;

import java.util.List;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.CardInfo;

public interface AccountInfoMapper {
	
	public int getAccountCountByUserSeq(int userSeq);	
	public int insertAccount(AccountInfo account);
	public AccountInfo getAccountInfoByAccountNum(String accountNum);
	
	public List<AccountInfo> getAllAcountInfoByUserSeq(int userSeq);
	public CardInfo getCardInfoByAccountNum(String accountNum);
}