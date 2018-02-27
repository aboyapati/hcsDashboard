package com.tekvizion.hcs.projectmanagement.security;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.DigestUtils;

public class UserLoginDetails {

	private final Map<String, String> loginMap = new HashMap<String, String>();
	private final Map<String, String> loginMapWithUseDetails = new HashMap<String, String>();
	
	private static UserLoginDetails userLoginDetails = null;
	
	public static UserLoginDetails getInstance(){
		if(userLoginDetails==null){
			userLoginDetails = new UserLoginDetails();
		}
		return userLoginDetails;
	}
	
	public UserLoginDetails() {
		
	}

	public boolean isSessionExists(String id){
		return this.loginMap.containsKey(DigestUtils.md5DigestAsHex(id.toLowerCase().getBytes()));
	}
	
	public void addMap(String key, String val){
		this.loginMap.put(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes()), val);
	}
	
	public void delMap(String key){
		this.loginMap.remove(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes()));
	}

	
	public void delMapEncrypted(String key){
		this.loginMap.remove(key);
	}
	
	@Override
	public String toString() {
		return "UserLoginDetails [loginMap=" + loginMap + "], userLoginMap=" + loginMapWithUseDetails + "]";
	}
	
	
	public void addUserDetailsMap(String key, String val){
		this.loginMapWithUseDetails.put(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes()), 
				DigestUtils.md5DigestAsHex(val.toLowerCase().getBytes()));
	}
	
	
	public void delUserDetailsMap(String key){
		this.loginMapWithUseDetails.remove(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes()));
	}

	
	public String getSessionString(String key){
		if(this.loginMapWithUseDetails.containsKey(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes())))
			return this.loginMapWithUseDetails.get(DigestUtils.md5DigestAsHex(key.toLowerCase().getBytes()));
		return null;
	}
}
