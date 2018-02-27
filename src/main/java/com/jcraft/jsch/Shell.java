package com.jcraft.jsch;
import com.jcraft.jsch.*;

import org.apache.log4j.Logger;

import java.awt.*;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

import javax.swing.*;

public class Shell{
	private Logger log = Logger.getLogger(this.getClass());

	private Channel channel;	
	private String user;
	private String password;
	private String host;
	private String command;
	private String commandResult;
	private int    commandTimeout;				// in seconds
	private int    sessionTimeout;				// in seconds
	private String errorString;
	private Boolean error;
	Session session;
	/**
	 * Use this constructor if you want to use default timer:
	 *  command timer: 10 seconds
	 *  session timer: 3 seconds
	 * @param u
	 * @param p
	 * @param h
	 * @param c
	 */
	public Shell(String u, String p, String h, String c){
		this.user = u;
		this.password = p;
		this.host = h;
		this.command = c;
		this.commandTimeout = 10;
		this.sessionTimeout = 3;
	}
	/**
	 * Use this constructor if you want to use the default session timer: 3 seconds
	 * @param u
	 * @param p
	 * @param h
	 * @param c
	 * @param ct
	 */
	public Shell(String u, String p, String h, String c, int ct){
		this.user = u;
		this.password = p;
		this.host = h;
		this.command = c;
		this.commandTimeout = ct;
		this.sessionTimeout = 3;
	}
	/**
	 * Use this constructor if you want to specify the command and session timers/
	 * @param u
	 * @param p
	 * @param h
	 * @param c
	 * @param ct
	 * @param st
	 */
	public Shell(String u, String p, String h, String c, int ct, int st){
		this.user = u;
		this.password = p;
		this.host = h;
		this.command = c;
		this.commandTimeout = ct;
		this.sessionTimeout = st;
		log.debug("Session Timeout: " + st + " - Command Timeout: " + ct);
	}
	
	public void execute(){
		log.debug("Getting: '" + this.command + "' from user: " + this.user + "@" + this.host + " Psw: " + this.password);

		try{
			JSch jsch=new JSch();

			session=jsch.getSession(user, host, 22);
		    session.setPassword(password);

			UserInfo ui=new MyUserInfo();
			ui.setPassword(password);
			session.setUserInfo(ui);
			session.connect(this.sessionTimeout*1000);
			channel=session.openChannel("shell");

			// Set Streams
//			InputStream cmdStream = new ByteArrayInputStream(command.getBytes(StandardCharsets.UTF_8.name()));
//			channel.setInputStream(cmdStream);
			channel.setOutputStream(System.out);		// needs to change
			channel.setInputStream(System.in);
			channel.connect();
			
//			channel.connect(3*1000);
//			
//			Thread.sleep(3000);
//			
//			
//			channel.disconnect();
//			session.disconnect();
			this.error = false;
			this.errorString = "";
		}
		catch(Exception e){
			log.error(e);
			this.error = true;
			this.errorString = "Exception: " + e;
		}
	}

	public void disconnect(){
		channel.disconnect();
		session.disconnect();		
	}
	
	public void send(String command){
		InputStream cmdStream = null;
		try {
			cmdStream = new ByteArrayInputStream(command.getBytes(StandardCharsets.UTF_8.name()));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		channel.setInputStream(cmdStream);
		try {
			channel.connect(3*1000);
		} catch (JSchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public class MyUserInfo implements UserInfo{
		String passwd;
		public void setPassword(String p) {passwd = p;}
		public String getPassword(){ return passwd; }

		public boolean promptYesNo(String str){
			return true;
		}  

		public String getPassphrase(){ return null; }
		public boolean promptPassphrase(String message){ return true; }

		public boolean promptPassword(String xyz){
			return true;   	      
		}
		public void showMessage(String message){
		}
	}

	public String getCommandResult() {
		return commandResult;
	}
	public String getErrorString() {
		return errorString;
	}
	public Boolean getError() {
		return error;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public void setCommandTimeout(int commandTimeout) {
		this.commandTimeout = commandTimeout;
	}
	public void setSessionTimeout(int sessionTimeout) {
		this.sessionTimeout = sessionTimeout;
	}
}
