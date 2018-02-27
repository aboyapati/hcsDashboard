package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.tekvizion.hcs.util.EmailTypes;

@Entity(name="email_tracker")
public class EmailTracker {
	
	@Id
	@GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	@Column(name = "body",length=2048)
	private String body;
	
	@Column(name = "subject")
	private String subject;
	
	@Column(name = "cc")
	private String cc;
	
	@Column(name = "to_email")
	private String to;
	
	@Column(name = "bcc",length=2048)
	private String bcc;
	
	@Column(name = "status", columnDefinition="tinyint(1) default 0" )
	private boolean status;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "emailType")
	private EmailTypes emailTypes;
	
	@Transient
	String userName;
	
	@Transient
	String loginId;
	
	@Transient
	boolean isHtmlBody = false;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	
	public EmailTypes getEmailTypes() {
		return emailTypes;
	}
	public void setEmailTypes(EmailTypes emailTypes) {
		this.emailTypes = emailTypes;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public boolean isHtmlBody() {
		return isHtmlBody;
	}
	public void setHtmlBody(boolean isHtmlBody) {
		this.isHtmlBody = isHtmlBody;
	}
	
	
}
