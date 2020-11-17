package com.joo.tutorial.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CardInfo {
	
	String cardNum;
	int userSeq;
	String accountNum;
	Date createDt;
	Date updateDt;
	Date expireDt;
	boolean active;

}
