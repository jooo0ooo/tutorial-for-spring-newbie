package com.joo.tutorial.bean;

import java.math.BigInteger;
import java.util.Date;

import lombok.Data;

@Data
public class AccountInfo {
	
	String accountNum;
	int userSeq;
	BigInteger balance;
	String password;
	String alias;
	int sortOrder;
	boolean securityActive;
	Date createDt;
	Date updateDt;

}
