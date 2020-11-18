package com.joo.tutorial.spring.service;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.CardInfo;
import com.joo.tutorial.spring.mapper.AccountInfoMapper;

@Service
public class AccountInfoService {

	@Autowired
	private AccountInfoMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public List<AccountInfo> getAllAcountNCardInfoByUserSeq(int userSeq) {
		
		List<AccountInfo> accountList = mapper.getAllAcountInfoByUserSeq(userSeq);
		
		for(AccountInfo account : accountList) {
			CardInfo card = mapper.getCardInfoByAccountNum(account.getAccountNum());
			account.setCardInfo(card);
			Gson gson = new Gson();
			account.setTotalData(gson.toJson(account));
		}
		
		return accountList;
	}
	
	public boolean updateAccount(String alias, String accountNum) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("alias", alias);
		param.put("accountNum", accountNum);
		
		return mapper.updateAccount(param) > 0;
		
	}
	
	public synchronized AccountInfo makeAccount(AccountInfo account) {
		
		int existAccountCount = mapper.getAccountCountByUserSeq(account.getUserSeq());
		account.setSortOrder(existAccountCount);
		
		String accountNum = null;
		int count = 0;
		int maxTry = 300;
		
		do {
			accountNum = generateAccountNumInIbanFormat(account.getAccountNum());
			
			// 정해진 횟수 이상 시도할 경우 중단
			if (++count > maxTry) {
				return null;
			}
			
		} while(isExistAccountNum(accountNum));
		
		account.setAccountNum(accountNum);
		account.setPassword(bcryptPasswordEncoder.encode(account.getPassword()));
		
		mapper.insertAccount(account);
		
		return mapper.getAccountInfoByAccountNum(accountNum);
		
	}
	
	private String generateAccountNumInIbanFormat(String accountNum) {
		
		String customNum = accountNum;
		
		if(customNum == null) {
			SecureRandom rnd = new SecureRandom();
	    	StringBuffer buf = new StringBuffer();
	    	
	    	for (int i = 0 ; i < 6 ; i++) {
	    		if(i == 0) {
	    			buf.append(rnd.nextInt(9) + 1);
	    		} else {
	    			buf.append(rnd.nextInt(10));
	    		}
	    	}
	    	customNum = buf.toString();
		}
		
    	String SequenceForMakingIBAN = customNum + "221900";
    	String firstDivide = SequenceForMakingIBAN.substring(0, 9);
    	
    	int firstMod = Integer.parseInt(firstDivide) % 97;
    	String secondDivide = firstMod + SequenceForMakingIBAN.substring(9);
    	
    	int secondMod = Integer.parseInt(secondDivide) % 97;
    	int checkCode = 97 - secondMod + 1;
    	
    	return "MJ" + String.format("%02d", checkCode) + customNum;
	}
	
	public boolean isExistAccountNum(String accountNum) {
		
		if(accountNum.length() == 6) {
			accountNum = generateAccountNumInIbanFormat(accountNum);
		}
		
		AccountInfo account = mapper.getAccountInfoByAccountNum(accountNum);
		
		if(account != null) {
			return true;
		} else {
			return false;
		}
		
	}
	
}