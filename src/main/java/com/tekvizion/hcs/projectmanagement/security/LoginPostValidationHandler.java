package com.tekvizion.hcs.projectmanagement.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service
public class LoginPostValidationHandler extends
			SavedRequestAwareAuthenticationSuccessHandler{

	@Autowired
	private UserLoginDetails userLoginDetails;
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws ServletException, IOException {
		
        User user = (User) authentication.getPrincipal();
        String userAgent = request.getHeader("user-agent");
		String host = request.getHeader("host");
		
		if(!this.userLoginDetails.isSessionExists(host.concat(userAgent))){
			this.userLoginDetails.addMap(host.concat(userAgent), request.getSession().getId());
			this.userLoginDetails.addUserDetailsMap(user.getUsername(), host.concat(userAgent));
		} 
        super.onAuthenticationSuccess(request, response, authentication);
    }
}
