package com.joo.tutorial.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		if (exception instanceof AuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "User does not exist.");
		
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "Wrong ID or password.");
			
		} else if(exception instanceof LockedException) {
			request.setAttribute("loginFailMsg", "This account is locked.");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "This account has been deactivated.");
			
		} else if(exception instanceof AccountExpiredException) {
			request.setAttribute("loginFailMsg", "Your account has expired.");
			
		} else if(exception instanceof CredentialsExpiredException) {
			request.setAttribute("loginFailMsg", "Your password has expired.");
		}
		
		// 로그인 페이지로 다시 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/login");
		dispatcher.forward(request, response);
		
	}
	
}