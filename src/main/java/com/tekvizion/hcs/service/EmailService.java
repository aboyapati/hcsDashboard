package com.tekvizion.hcs.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.tekvizion.hcs.util.AppInitializer;
import com.tekvizion.hcs.modal.EmailTracker;

/**
 * Sends mail about the VM health to the users.
 */
@Component
public class EmailService implements Runnable {
		
	private JavaMailSenderImpl mailSender;
	
	private EmailTracker emailTracker;
		 
	private EmailTrackerService emailTrackerService;
	
	private static Logger logger = Logger.getLogger("rootLogger");

	public JavaMailSenderImpl getMailSender() {
		return mailSender;
	}
	
	public  void setMailSender(JavaMailSenderImpl mailSender) {
		if(mailSender==null)
			logger.debug("ERROR: SETTING NULL MAILSENDER");
		else
			logger.debug("SETTING REAL MAILSENDER");
		this.mailSender = mailSender;
		
	}
    
	public EmailService(){
		
	}
	private String to;
	private String cc;
	private String body;
	private String subject;
	private String bcc;
	
	public EmailService(JavaMailSenderImpl impl, EmailTracker emailTracker,EmailTrackerService emailTrackerService){
		setMailSender(impl);
		this.to = emailTracker.getTo();
		this.cc = emailTracker.getCc();
		this.bcc = emailTracker.getBcc();
		this.subject = emailTracker.getSubject();
		this.body = emailTracker.getBody();
		this.emailTracker=emailTracker;
		this.emailTrackerService=emailTrackerService;
	}
	
	public void run(){
		if(this.mailSender==null){
			emailTracker.setStatus(false);
			emailTrackerService.editEmailDetails(emailTracker);
			logger.fatal("ERROR: MAIL SENDER OBJECT IS NULL. RETURNING BACK FROM THE FUNCITON CALL");
			
			return;
		}

		MimeMessage mimeMessage  = this.mailSender.createMimeMessage();
		MimeMessageHelper helper = null;
		try {
			mimeMessage.setContent(body, "text/html");
			helper = new MimeMessageHelper(mimeMessage, true);
			if(!this.to.isEmpty()){
				helper.setTo(this.to.split(","));
			}
			helper.setSubject(subject);
			if(emailTracker.isHtmlBody())
			  helper.setText(body,true);
			else
			  helper.setText(body);
			
			if(!this.cc.isEmpty()){
				helper.setCc(this.cc.split(","));
			}
			
			if(this.bcc != null && !this.bcc.isEmpty()){
				helper.setBcc(this.bcc.split(","));
			}			
			helper.setFrom(AppInitializer.EMAIL_FROM_ADDRESS);
			
		} catch (MessagingException e1) {
			emailTracker.setStatus(false);
			emailTrackerService.editEmailDetails(emailTracker);
			logger.error("Got messaging exception");
			logger.error(e1.getMessage());			
		}
		
		if(helper==null){
			emailTracker.setStatus(false);
			emailTrackerService.editEmailDetails(emailTracker);
			logger.debug("Could not send email to ");			
		}else{		
			try{
				//Thread.sleep(10000);
				mailSender.send(mimeMessage);
				emailTracker.setStatus(true);
				emailTrackerService.editEmailDetails(emailTracker);
				logger.debug("mail sent successfully");
			//}catch (InterruptedException e1) {				
			}catch(MailException e){
				emailTracker.setStatus(false);
				emailTrackerService.editEmailDetails(emailTracker);
				logger.debug("mail not sent");
				logger.error(e.getMessage());
				logger.error(e.getLocalizedMessage());
			}
		}		
	}
}
