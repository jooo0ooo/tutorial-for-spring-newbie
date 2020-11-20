package com.joo.tutorial.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.BankMoneyBook;
import com.joo.tutorial.bean.CardInfo;

public interface AccountInfoMapper {
	
	public int getAccountCountByUserSeq(int userSeq);	
	public int insertAccount(AccountInfo account);
	public AccountInfo getAccountInfoByAccountNum(String accountNum);
	
	public List<AccountInfo> getAllAcountInfoByUserSeq(int userSeq);
	public CardInfo getCardInfoByAccountNum(String accountNum);
	
	public int updateAccount(HashMap<String, Object> param);
	
	public int insertCard(CardInfo card);
	
	public int insertBankMoneyBook(BankMoneyBook bmb);
	
	public BankMoneyBook getBankMoneyBookBySeq(int seq);
	
}