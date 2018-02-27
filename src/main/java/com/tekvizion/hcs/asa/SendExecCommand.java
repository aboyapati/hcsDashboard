package com.tekvizion.hcs.asa;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.Base64;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

/**
 * The purpose of this class is to send GET requests for the Cisco exec API
 * @author avidiyala
 *
 */
public class SendExecCommand {
	
	private String ip;
	private String username;
	private String password;
	
	private static Logger log = Logger.getLogger("rootLogger");
	
	/**
	 * @param ip - The ip address of the server to send requests to
	 * @param username - The username for request authentication
	 * @param password - The password for request authentication
	 */
	public SendExecCommand(String ip, String username, String password){
		this.ip = ip;
		this.username = username;
		this.password = password;
	}
	
	/**
	 * Method for sending the request to the server
	 * @param command - The commands to send to the server
	 * return - The response string or null if any error occurred
	 */
	public ResponseData sendCommand(String command){
		ResponseData data = new ResponseData();
		String url = "https://" + ip + "/exec/" + command;
		log.debug("The url for sending the command is " + url);
		disableSslVerification();
		//Basic Authentication header value is of format "Basic <'username:password' encoded in Base64>"
		String basicAuth = "Basic " + new String(Base64.getEncoder().encode((username+":"+password).getBytes()));
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.set("Authorization", basicAuth);
		HttpEntity<String> entityReq = new HttpEntity<String>(null, httpHeaders);
		RestTemplate restTemplate = new RestTemplate();
		//setting connection and socket timeouts
		//SimpleClientHttpRequestFactory rf = (SimpleClientHttpRequestFactory)restTemplate.getRequestFactory();
		//rf.setConnectTimeout(2000);
		//rf.setReadTimeout(20000);
		try{
			ResponseEntity<String> entity = restTemplate.exchange(url, HttpMethod.GET, entityReq, String.class);
			data.setStatus(true);
			if(entity != null){
				log.debug("Command sent successfully with url : " + url);
				data.setResponseCode(entity.getStatusCode().toString());
				data.setResult(entity.getBody());
			}
			//return entity != null ? entity.getBody() : null;
		} catch (HttpStatusCodeException e){
			data.setStatus(false);
			log.error("Command sent successfully for url : " + url + "with status : " + e.getStatusCode() + "\n" +e.getStatusText());
		}catch(Exception e){
			data.setStatus(false);
			log.error("Command sent successfully for url : " + url + "\n" +e);
		}
		return data;
	}
	
	private static void disableSslVerification() {
		log.debug("Disabling the Ssl Verification...");
	    try
	    {
	        // Create a trust manager that does not validate certificate chains
	        TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
	            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	                return null;
	            }
	            public void checkClientTrusted(X509Certificate[] certs, String authType) {
	            }
	            public void checkServerTrusted(X509Certificate[] certs, String authType) {
	            }
	        }
	        };

	        // Install the all-trusting trust manager
	        SSLContext sc = SSLContext.getInstance("SSL");
	        sc.init(null, trustAllCerts, new java.security.SecureRandom());
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

	        // Create all-trusting host name verifier
	        HostnameVerifier allHostsValid = new HostnameVerifier() {
	            public boolean verify(String hostname, SSLSession session) {
	                return true;
	            }
	        };

	        // Install the all-trusting host verifier
	        HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
	    } catch (NoSuchAlgorithmException e) {
	        log.error("Unable to retrieve the SSLContext object that implements SSL. Exception is " + e);
	    } catch (KeyManagementException e) {
	        log.error("Unable to initialize the SSLContext. Exception is " + e);
	    }
	}
}
