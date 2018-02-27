package com.tekvizion.hcs.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import org.apache.commons.lang3.SystemUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import com.tekvizion.hcs.modal.EmailTracker;
import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.service.EmailService;
import com.tekvizion.hcs.service.EmailTrackerService;
import com.tekvizion.hcs.service.UsersService;

/**
 * Notifies the mail server to send mail about the VM health to the users.
 */
@Component
public class EmailNotifier implements ApplicationContextAware{

	private static Logger logger = Logger.getLogger("rootLogger");
	public static final String Text_Alert="Text_Alert";
	public static final String HCS_Critical_Email="HCS_Critical_Email";
	
	ApplicationContext ctx;
	
	@Autowired 
	EmailTrackerService emailTrackerService;
	
	@Autowired
	private UsersService usersService;	
	
	private static Properties properties;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.ctx=applicationContext;
		
	}
	
	/**
	 * Method to send the mail about VM health to the users
	 * @param emailType
	 * @param emailTracker
	 * @return
	 */
	public void sendEmail(EmailTypes emailType,EmailTracker emailTracker){
		
		//Properties properties=AppInitializer.properties;
		String emailSubject = null;
		String emailBody = null;
		try {
			if(properties == null)
			{
				logger.debug("Reading value from the properties file");
				properties = new Properties();
				properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("app.properties"));
			}else{
				logger.debug("We already have the properties. No need to read the file");
			}
		} catch (IOException e) {
			logger.fatal("Error while loading messages.properties :\n", e);
		}
		try{
			logger.debug("Reading value from the properties for the key - "+emailType.getEmailSubject() );
			emailSubject = properties.getProperty(emailType.getEmailSubject());
			logger.debug("Reading value from the properties for the key - "+emailType.getEmailBody());
			emailBody = properties.getProperty(emailType.getEmailBody());
		}catch(Exception e){
			logger.fatal("-- Fail to read the email subject / body from the properties."+ e.getMessage());
		}
		String type=emailType.name();
		if(emailSubject==null|| emailSubject.equals("") || emailBody==null || emailBody.equals("")){
			return;
		}
		switch(type){
		
    		case Text_Alert:
	    		this.sendEmailForTextAlert(emailBody,emailSubject,emailTracker);
	    		break;
			case HCS_Critical_Email:
	    		this.sendNotifyForEmail(emailBody,emailSubject,emailTracker);
	    		break;    		    	
	    }
	}
	
	/**
	 * Method to send the text alert about VM health to the users
	 * @param body
	 * @param subject
	 * @param emailTracker
	 * @return
	 */
	private void sendEmailForTextAlert(String body,String subject,EmailTracker emailTracker){
		logger.info("========================== sendEmailForTextAlert - Start ==========================");
		String loginId=emailTracker.getLoginId();
		String userName=emailTracker.getUserName();
		String emailSubject = MessageFormat.format(subject, userName);
		String emailBody=MessageFormat.format(body, userName,SystemUtils.LINE_SEPARATOR);
		emailTracker.setBody(emailBody);
		emailTracker.setSubject(emailSubject);
		emailTracker.setUserName(userName);
		emailTracker.setLoginId(loginId);
		this.emailTrackerService.addEmailDetails(emailTracker);
		this.sendTextAlert(emailTracker);
		logger.info("========================== sendEmailForTextAlert - End ==========================");
	}
	
	/**
	 * Method to send the tmail about VM health to the users
	 * @param body
	 * @param subject
	 * @param emailTracker
	 * @return
	 */	
	private void sendNotifyForEmail(String body,String subject,EmailTracker emailTracker){
		logger.info("========================== sendNotifyForHCSEmail - Start ==========================");
		String userName = emailTracker.getUserName();
		String loginId = emailTracker.getLoginId();
		String emailsubject = MessageFormat.format(subject, userName);
		String emailBody = MessageFormat.format(body, userName, loginId, SystemUtils.LINE_SEPARATOR);
		emailTracker.setBody(emailBody);
		emailTracker.setSubject(emailsubject);
		emailTracker.setLoginId(loginId);
		emailTrackerService.addEmailDetails(emailTracker);
		this.send(emailTracker);		 
		logger.info("========================== sendNotifyForHCSEmail - End ==========================");
	}
	
	/**
	 * Method to send the text alert about VM health to the users
	 * @param emailTracker
	 * @return
	 */	
	private void sendTextAlert(EmailTracker emailTracker){
		Users loggedUser =usersService.getUserByLogin(emailTracker.getLoginId());
		if(loggedUser.isTextAlert()){
			startMailSendThread(emailTracker);
			return;
		}
		emailTracker.setStatus(false);
		this.emailTrackerService.editEmailDetails(emailTracker);
		return;
	}
	
	/**
	 * Method to send the mail about VM health to the users
	 * @param emailTracker
	 * @return
	 */	
	private void send(EmailTracker emailTracker){
		Users loggedUser =usersService.getUserByLogin(emailTracker.getLoginId());
		if(loggedUser.isEmailnotification()){
			startMailSendThread(emailTracker);
			return;
			
		}
		emailTracker.setStatus(false);
		this.emailTrackerService.editEmailDetails(emailTracker);
		return;
	}
	
	/**
	 * Method to start sending the text alerts (or) emails about VM health to the users
	 * @param emailTracker
	 * @return
	 */	
	private void startMailSendThread(EmailTracker emailTracker){
		JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) ctx .getBean("mailSender");
		Runnable runnable = new EmailService(mailSenderImpl,emailTracker,emailTrackerService);
		new Thread(runnable).start();
	}
}
