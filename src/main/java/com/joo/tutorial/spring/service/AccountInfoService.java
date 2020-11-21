package com.joo.tutorial.spring.service;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.joo.tutorial.bean.AccountInfo;
import com.joo.tutorial.bean.BankMoneyBook;
import com.joo.tutorial.bean.CardInfo;
import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.mapper.AccountInfoMapper;
import com.joo.tutorial.util.SessionUtil;
import com.joo.tutorial.util.SessionUtil.SESSION_ATTR_KEY;

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
	
	public List<AccountInfo> getAllAccountInfoByUserSeq(int userSeq) {
		return mapper.getAllAcountInfoByUserSeq(userSeq);
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
	
	private String generateCardNumInGeneralFormat(String accountNum, String phone) {
		
		int accountCheckCodeFirstDigit = Integer.parseInt(accountNum.substring(2, 3));
		int accountCheckCodeSecondDigit = Integer.parseInt(accountNum.substring(3, 4));
		
		int phoneHeadLastNum = Integer.parseInt(phone.substring(5, 6));
		int phoneBodyNum = Integer.parseInt(phone.substring(6).replace("-", ""));
		int phoneCheckCode = 0;
		
		for (int i = 0; i < 8; i++) {
			phoneCheckCode += phoneBodyNum % 10;
			phoneBodyNum /= 10;
		}
		
		int phoneCheckCodeFirstDigit = phoneCheckCode / 10;
		int phoneCheckCodeSecondDigit = phoneCheckCode % 10;
		
		int cardCheckCode = 10 - ((36 + accountCheckCodeFirstDigit * 2 + accountCheckCodeSecondDigit 
				+ phoneCheckCodeFirstDigit * 2 + phoneCheckCodeSecondDigit 
				+ phoneHeadLastNum * 2) % 10);
		
		return "9000" + accountCheckCodeFirstDigit + accountCheckCodeSecondDigit 
				+ phoneCheckCodeFirstDigit + phoneCheckCodeSecondDigit 
				+ "221901" + phoneHeadLastNum + cardCheckCode;
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
	
	public CardInfo makeCard(String accountNum) {
		
		CardInfo card = new CardInfo();
		card.setCardNum(generateCardNumInGeneralFormat(accountNum, SessionUtil.getSession().getPhone()));
		card.setUserSeq(SessionUtil.getUserSeq());
		card.setAccountNum(accountNum);
		
		mapper.insertCard(card);
		
		return mapper.getCardInfoByAccountNum(accountNum);
	}
	
	public CardInfo getCardInfoByAccountNum(String accountNum) {
		return mapper.getCardInfoByAccountNum(accountNum);
	}
	
	public AccountInfo getAccountInfoByAccountNum(String accountNum) {
		return mapper.getAccountInfoByAccountNum(accountNum);
	}
	
	public boolean checkPasswordMatch(AccountInfo account, String password) {
		
		return bcryptPasswordEncoder.matches(password, account.getPassword());
		
	}
	
	public boolean confirm(String password) {
		BankMoneyBook bmb = (BankMoneyBook) SessionUtil.getValue(SESSION_ATTR_KEY.BANK_MONEY_BOOK);	
		AccountInfo account = getAccountInfoByAccountNum(bmb.getAccountNum());
		if (checkPasswordMatch(account, password) && insertBankMoneyBook(bmb) > 0) {
			
			getAccountInfoByAccountNum(bmb.getDepositAccountNum());
			
			return true;
		} else {
			return false;
		}
	}
	
	public int insertBankMoneyBook(BankMoneyBook bmb) {
		return mapper.insertBankMoneyBook(bmb);
	}
	
	public BankMoneyBook getBankMoneyBookBySeq(int seq) {
		return mapper.getBankMoneyBookBySeq(seq);
	}
	
	public boolean upgradeSecurityLevel(String accountNum) {
		return mapper.upgradeSecurityLevel(accountNum) > 0;
	}
	
	public List<BankMoneyBook> getTransferHistory(String accountNum) {
		return mapper.getTransferHistory(accountNum);
	}
}