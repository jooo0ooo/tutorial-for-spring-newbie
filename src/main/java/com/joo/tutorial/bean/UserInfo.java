package com.joo.tutorial.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class UserInfo implements UserDetails {
	
	private static final long serialVersionUID = 3297383149578717638L;
	
	private String idNumber;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String birthDate;
	private String job;
	private String address;
	private Date createDt;
	private Date updateDt;
	private String auth;	
	private boolean enabled;
	
	private String lastName;
	private String firstName;
	private String passwordRepeat;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(auth));
		return authList;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	@Override
	public String getUsername() {
		return name;
	}
	
}