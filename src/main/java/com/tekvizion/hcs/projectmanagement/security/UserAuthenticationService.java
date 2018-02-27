package com.tekvizion.hcs.projectmanagement.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.tekvizion.hcs.exception.MultipleUsersFoundException;
import com.tekvizion.hcs.exception.UserNotFoundException;
import com.tekvizion.hcs.modal.UserType;
import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.service.UsersService;



public class UserAuthenticationService implements UserDetailsService, ApplicationContextAware {

	@Autowired
	private UsersService usersService;
	
	private ApplicationContext ctx;
	
	static Logger log = Logger.getLogger("rootLogger");
	
	
	@Override
	public UserDetails loadUserByUsername(String name)
			throws UsernameNotFoundException {
		
		
		log.debug("User "+ name+" getting authenticated");
		if(this.usersService == null){
			log.fatal("Use service is null");
			try {
				this.usersService = this.ctx.getBean(UsersService.class);
			} catch (Exception e){
				log.fatal(" got exception while getting service bean");
				log.fatal(e.getMessage());
			}
		}
		
		Users user = null;
		try {
			log.debug("getting details of user:"+name);
			user = this.usersService.getUserByLogin(name);
			log.debug("User authenticated");
		} catch (UserNotFoundException ex){
			log.debug("User with loginid:"+name+" not found");
			throw new UsernameNotFoundException("User with loginid:"+name+" not found");
		} catch (MultipleUsersFoundException ex){
			log.debug("Multiple User with loginid:"+name+" not found");
			throw new UsernameNotFoundException(ex.getErrMsg());
		} catch (Exception e){
			log.fatal(e.getMessage());
		}
		if(user==null){
			log.fatal("Unexpected event!!!! user is null");
		}
		if(user.getUsertype()==null){
			log.debug("No user roles found for user:"+name);
			throw new UsernameNotFoundException("No user roles found for user:"+name);
		} 
		log.debug("User detailed fetched from database, authenticated, authorization done!!");

		return new User(user.getLoginId(), user.getPassword(), 
					this.getAuth(user.getUsertype()));
	}


	private Collection<? extends GrantedAuthority> getAuth(UserType uRole){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(uRole.getName()));
		return authorities;
	}


	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.ctx = applicationContext;
	}


	public UsersService getUserService() {
		return usersService;
	}


	public void setUserService(UsersService userService) {
		this.usersService = userService;
	}
	
}
