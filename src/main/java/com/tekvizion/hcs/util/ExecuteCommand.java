package com.tekvizion.hcs.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;
import org.aspectj.weaver.patterns.ISignaturePattern;

public class ExecuteCommand {

	private String command;
	private Logger log;
	private boolean wait;
	private int exitCode = 1;

	public ExecuteCommand(String cmd, Logger log, boolean wait) {
		this.command = cmd;
		this.log = log;
		this.wait = wait;
	}
	
	/**
	 * Method to run the command and do not wait for response
	 * @return
	 */
	public boolean run(){
		log.debug("Executing: " + command + " [Fire and Forget cmd]");
	    Runtime rt = Runtime.getRuntime();
    	try {
			rt.exec(command);
			return true;
		} catch (IOException e) {
			log.fatal("Error executing command: " + command + " " + e);
			return false;
		}		
	}
	
	public int getExitCode() {
		return exitCode;
	}

	public void setExitCode(int exitCode) {
		this.exitCode = exitCode;
	}

	/**
	 * Method to run the command and wait for the response
	 * @return
	 */
	public String runAndWait() {

		log.debug("Executing: " + command + " [Wait: " + String.valueOf(this.wait) +"]");
		Runtime rt = Runtime.getRuntime();
        Process proc = null;
		try {
			proc = rt.exec(command);
		} catch (IOException e) {
			log.fatal("Error exeuting command: " + command + " " + e.getMessage());
			return "";
		}
        StreamCatcher es = new StreamCatcher(proc.getErrorStream(), "ERROR");            
        StreamCatcher os = new StreamCatcher(proc.getInputStream(), "OUTPUT");
        es.start();
        os.start();
        
        if(this.wait){
        	log.debug("Will wait for cmd to finish executing");
			try {
				exitCode = proc.waitFor();
				log.debug("Exit value: " + exitCode);
			} catch (InterruptedException e) {
				log.debug("Failed to wait for proess. " + e.getMessage());
				return "";
			}
			log.debug("Cmd finished executing");
        	try {
    			Thread.sleep(1000);
    		} catch (InterruptedException e) {
    			log.fatal("Failed to sleep for 1 sec." + e.getMessage());
    		}
        	
        }
        log.debug("Error Stream: \n" + es.getOutput().toString());
        log.debug("Output Stream: \n" + os.getOutput().toString());
 		return es.getOutput().toString() + os.getOutput().toString();
	}
	
	/**
	 * Class to capture the input stream of the command execution
	 * @author knalla
	 */
	class StreamCatcher extends Thread {
	    InputStream is;
	    String type;
	    StringBuffer output;
	    
	    StreamCatcher(InputStream is, String type) {	    
	        this.is = is;
	        this.type = type;
	        output = new StringBuffer();

	    }
	    
	    public StringBuffer getOutput() {
			return output;
		}

		public void run() {	    	
	        try{
	        
	            InputStreamReader isr = new InputStreamReader(is);
	            BufferedReader br = new BufferedReader(isr);

	            String line=null;
	            while ( (line = br.readLine()) != null){
	            	output.append(line + "\n");
	            }
	            
	            isr.close();
	            br.close();
	            } catch (IOException ioe) {
	            	log.fatal("Error reading stream. " + ioe.getMessage());
	            }
	        	
	    }
	}
	
}
