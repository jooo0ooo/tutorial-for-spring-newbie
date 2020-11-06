package com.joo.tutorial.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.joo.tutorial.bean.UserInfo;

public class SessionUtil {
	
	public enum SESSION_ATTR_KEY {
		LOGINID,
		USER_SEQ,
	}

	public static UserInfo getSession() {
		try {
			Object userInfo = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return (UserInfo) userInfo;
		} catch (Exception e) {
			return null;
		}
	}
	
	public static boolean isLogin() {
		UserInfo userInfo = getSession();
		if (userInfo != null) {
			return true;
		} else {
			return false;
		}
	}

	public static int getUserSeq() {
		UserInfo user = getSession();
		return user == null ? 0 : user.getSeq();
	}

	public static void setValue(SESSION_ATTR_KEY key, Object obj) {
		HttpSession session = getRequest().getSession();
		session.setAttribute(key.name(), obj);
	}
	
	public static Object getValue(SESSION_ATTR_KEY key) {
		HttpSession session = getRequest().getSession();
		return session.getAttribute(key.name());
	}
	
	public static void removeValue(SESSION_ATTR_KEY key) {
		HttpSession session = getRequest().getSession();
		session.removeAttribute(key.name());
	}
	
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	}
	
	public static HttpServletResponse getResponse() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
	}
	
}
