package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

import com.tekvizion.hcs.modal.CarriersType;

@Entity
public class Users {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;

	@Column(name = "name")
	private String name;
	
	@Column(name = "login_id",nullable = false)
	private String loginId;

	@Column(name = "password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="usertype")
	private UserType usertype;
	
	@Column(name="del", columnDefinition="tinyint(1) default false")
	private boolean del = false;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "mobileNumber")
	private String mobileNumber;
	
	@ManyToOne
	@JoinColumn(name="carriersType_Id")
	private CarriersType carriersType;	
	
	@Column(name = "email_notification",columnDefinition="tinyint(1) default false")
	private boolean emailnotification;
	
	@Column(name = "textAlert",columnDefinition="tinyint(1) default false")
	private boolean textAlert;

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

	public UserType getUsertype() {
		return usertype;
	}

	public void setUsertype(UserType usertype) {
		this.usertype = usertype;
	}

	public boolean isDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
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

	public CarriersType getCarriersType() {
		return carriersType;
	}

	public void setCarriersType(CarriersType carriersType) {
		this.carriersType = carriersType;
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
}
