package com.joo.tutorial.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.mapper.UserInfoMapper;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public boolean register(UserInfo users) {
		
		users.setName(users.getLastName() + " " + users.getFirstName());
		
		if(!users.getPassword().equals(users.getPasswordRepeat())) {
			return false;
		}
		
		String endcodedPassword = bcryptPasswordEncoder.encode(users.getPassword());
		users.setPassword(endcodedPassword);
		
		return mapper.register(users) > 0;
	}
	
	public UserInfo getUserInfoByIdNumber(String idNumber) {
		return mapper.getUserInfoByIdNumber(idNumber);
	}
	
	public boolean isAlreadyExistUser(UserInfo user) {
		return mapper.isAlreadyExistUser(user);
	}
	
}