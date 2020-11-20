package com.joo.tutorial.bean;

import java.math.BigInteger;
import java.util.Date;

import com.joo.tutorial.enums.TransactionType;

import lombok.Data;

@Data
public class BankMoneyBook {
	
	int seq;
	TransactionType transactionType;
	BigInteger amount;
	int fee;	
	String content;
	String accountNum;
	String depositAccountNum;
	Date createDt;
	
	String receiverName;
}
