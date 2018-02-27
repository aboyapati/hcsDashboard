package com.tekvizion.hcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AutoLoginController {
	
	@Autowired
    protected AuthenticationManager authenticationManager;
	
	private static Logger logger = Logger.getLogger("rootLogger");

	/**
	 * This method creates a session for the user with the given username and password if valid
	 * @param username
	 * @param password
	 * @param request
	 * @param location
	 * @return
	 */
	@RequestMapping(value = "/autologin", method = {RequestMethod.GET,RequestMethod.POST})
	public String doAutoLogin(String username, String password, HttpServletRequest request,@RequestParam(value = "location", required = false) String location) {

		logger.debug("\n\n\n************************** AUTO LOGIN METHOD INVOKED *****************************\n\n");
		
		try{

		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		logger.debug("Token "+token);
        // generate session if one doesn't exist
        request.getSession();
        token.setDetails(new WebAuthenticationDetails(request));

        	Authentication authenticatedUser = authenticationManager.authenticate(token);
	        logger.debug("AU " +authenticatedUser);
	        logger.debug("AU bool " +authenticatedUser.isAuthenticated());
	        SecurityContext securityContext = SecurityContextHolder.getContext();
	        securityContext.setAuthentication(authenticatedUser);
	        
	        HttpSession session = request.getSession(true);
	        session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
	        session.setAttribute("appUrl", location);
	        logger.debug("Authentication Success... Redirecting to dashboard");
	        return "redirect:dashboard";
        }catch (Exception e) {
        	e.printStackTrace();
        	logger.debug("Authentication error.... "+e.getMessage());
        	logger.debug("Authentication Failed..... Redirecting back to Central Server");
        	return "redirect:"+location;
		}
	}
}