package com.jcraft.jsch;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.util.EmptyStackException;
import java.util.concurrent.TimeoutException;

import org.apache.log4j.Logger;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.UserInfo;


public class SshCmd {
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
	/**
	 * Use this constructor if you want to use default timer:
	 *  command timer: 10 seconds
	 *  session timer: 3 seconds
	 * @param u
	 * @param p
	 * @param h
	 * @param c
	 */
	public SshCmd(String u, String p, String h, String c){
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
	public SshCmd(String u, String p, String h, String c, int ct){
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
	public SshCmd(String u, String p, String h, String c, int ct, int st){
		this.user = u;
		this.password = p;
		this.host = h;
		this.command = c;
		this.commandTimeout = ct;
		this.sessionTimeout = st;
		log.debug("Session Timeout: " + st + " - Command Timeout: " + ct);
	}
	
	
	public SshCmd getShhCommand()  {

		log.debug("Getting: '" + command + "' from user: " + user + "@" + host + " Psw: " + password);
		channel = null;
		try{
			JSch jsch=new JSch();  

			Session session=jsch.getSession(user, host, 22);
			
			UserInfo ui=new MyUserInfo();
			
			ui.setPassword(password);
						
			session.setUserInfo(ui);
			
			session.connect(this.sessionTimeout*1000);
			
			channel=session.openChannel("exec");
			((ChannelExec)channel).setCommand(command);

			channel.setInputStream(null);

			((ChannelExec)channel).setErrStream(System.err);

			InputStream in=channel.getInputStream();

			channel.connect();
			this.commandResult = _getData(in,this.commandTimeout);
		
			channel.disconnect();
			session.disconnect();
		}
		catch (SocketException e){ 
			log.error(e);
			this.errorString = "Exception: " + e;
			this.error = true;;
		}
		catch(Exception e){
			log.error(e);
			this.errorString = "Exception: " + e;
			this.error = true;
			return this;
		}
	
		this.error = false;
		this.errorString = "";
		return this;
	}

    private String cmdRes;
	private String _getData(InputStream in, int timeOut) throws CommandTimeoutException {
		
		cmdRes = "";
		int loop = 0;
		byte[] tmp=new byte[1024];
		while(true){
			loop++;
			if(loop > timeOut) {
				String e = "Time out on getting a response for the command.";
				log.error(e);	
				this.error = true;
				this.errorString = e;		
				throw new CommandTimeoutException();	
			}
			try {
				while(in.available()>0){
					int i=in.read(tmp, 0, 1024);
					if(i<0)break;
					cmdRes += new String(tmp, 0, i);
				}
			} catch (IOException e) {
				System.err.println("IOException: " + e);
			}
			if(channel.isClosed()){
				try {
					if(in.available()>0) continue;
				} catch (IOException e) {
					log.error("IOException inside channel.isClosed(): " + e);
				}
				break;
			}
			try{Thread.sleep(1000);}catch(Exception ee){
				log.error("Sleep Exception: " + ee);}
		}
		return cmdRes;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getCommand() {
		return command;
	}


	public void setCommand(String command) {
		this.command = command;
	}


	public String getCommandResult() {
		return commandResult;
	}


	public void setCommandResult(String commandResult) {
		this.commandResult = commandResult;
	}
	
	public int getCommandTimeout() {
		return commandTimeout;
	}

	public void setCommandTimeout(int commandTimeout) {
		this.commandTimeout = commandTimeout;
	}

	public int getSessionTimeout() {
		return sessionTimeout;
	}

	public void setSessionTimeout(int sessionTimeout) {
		this.sessionTimeout = sessionTimeout;
	}

	public String getErrorString() {
		return errorString;
	}
	public void setErrorString(String errorString) {
		this.errorString = errorString;
	}
	public Boolean getError() {
		return error;
	}
	public void setError(Boolean error) {
		this.error = error;
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
}
