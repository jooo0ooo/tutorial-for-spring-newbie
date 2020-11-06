package com.joo.tutorial.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.joo.tutorial.bean.UserInfo;
import com.joo.tutorial.spring.mapper.UserInfoMapper;

public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		UserInfo user = userInfoMapper.getUserByEmail(email);
		
		if(user == null) {
			 throw new UsernameNotFoundException("email " + email + " not found");
		}
		
		return user;
	}

}