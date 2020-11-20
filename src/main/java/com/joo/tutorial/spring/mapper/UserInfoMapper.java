package com.joo.tutorial.spring.mapper;

import com.joo.tutorial.bean.UserInfo;

public interface UserInfoMapper {
	
	public int register(UserInfo user);
	
	public UserInfo getUserByEmail(String email);
	
	public UserInfo getUserInfoByUserSeq(int userSeq);
	
}