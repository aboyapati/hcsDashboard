package com.tekvizion.hcs.projectmanagement.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class SessionExpirationListener implements
		ApplicationListener<SessionDestroyedEvent> {

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserLoginDetails userLoginDetails;

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		
		List<SecurityContext> lstSecurityContext = event.getSecurityContexts();
	    UserDetails ud;
	    for (SecurityContext securityContext : lstSecurityContext)
	    {
	        ud = (UserDetails) securityContext.getAuthentication().getPrincipal();
	        String sessionStr = this.userLoginDetails.getSessionString(ud.getUsername());
	        if(sessionStr!=null)
	        	this.userLoginDetails.delMapEncrypted(sessionStr);
	        this.userLoginDetails.delUserDetailsMap(ud.getUsername());
	    }		
	}

}
