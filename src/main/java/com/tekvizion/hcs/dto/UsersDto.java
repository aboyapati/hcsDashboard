package com.tekvizion.hcs.dto;

public class UsersDto {
	
	public String id;
	
	public String name;
	
	public String loginId;
	
	public String password;
	
	public String email;
	
	public String mobileNumber;
	
	public String customerId;
	
	public String providerId;
	
	public String userTypeName;
	
	public boolean emailnotification;
	
	public boolean textAlert;
	
	public String carrierTypeName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getProviderId() {
		return providerId;
	}

	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}

	public String getUserTypeName() {
		return userTypeName;
	}

	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}

	public boolean isEmailnotification() {
		return emailnotification;
	}

	public void setEmailnotification(boolean emailnotification) {
		this.emailnotification = emailnotification;
	}

	public boolean isTextAlert() {
		return textAlert;
	}

	public void setTextAlert(boolean textAlert) {
		this.textAlert = textAlert;
	}

	public String getCarrierTypeName() {
		return carrierTypeName;
	}

	public void setCarrierTypeName(String carrierTypeName) {
		this.carrierTypeName = carrierTypeName;
	}
	
}