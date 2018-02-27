package com.tekvizion.hcs.projectmanagement.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.LogoutHandler;

public class MyLogoutHandler implements LogoutHandler {

	@Autowired
	private UserLoginDetails userLoginDetails;

	@Override
	public void logout(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication) {
		String userAgent = request.getHeader("user-agent");
		String host = request.getHeader("host");
		if(this.userLoginDetails.isSessionExists(host.concat(userAgent))){
			this.userLoginDetails.delMap(host.concat(userAgent));
			try {
				User user = (User) authentication.getPrincipal();
				if(user != null){
					this.userLoginDetails.delUserDetailsMap(user.getUsername());
				}	
			} catch (Exception e){}	
		} 
		
	}
}
