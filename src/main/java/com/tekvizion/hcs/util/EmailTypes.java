package com.tekvizion.hcs.util;

public enum EmailTypes {
	
	Text_Alert("hcs.textAlert.email.subject","hcs.textAlert.email.body"),
	HCS_Critical_Email("hcs.email.subject","hcs.email.body");
	
	private String emailSubject;
	private String emailBody;
	
	private EmailTypes(String emailSubject, String emailBody){
		this.emailSubject = emailSubject;
		this.emailBody = emailBody;
	}

	public String getEmailSubject() {
		return emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public String getEmailBody() {
		return emailBody;
	}

	public void setEmailBody(String emailBody) {
		this.emailBody = emailBody;
	}

	
}
