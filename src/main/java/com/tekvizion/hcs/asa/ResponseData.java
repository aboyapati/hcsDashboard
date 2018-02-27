package com.tekvizion.hcs.asa;

/**
 * Class that stores various data relating to the http response
 * @author avidiyala
 *
 */
public class ResponseData {

	/**
	 * Flag determining if the request was successful or not
	 */
	private boolean status;
	/**
	 * The response code in sending the http request
	 */
	private String responseCode;
	/**
	 * The http response body
	 */
	private String result;
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "ResponseData [status=" + status + ", responseCode=" + responseCode + ", result=" + result + "]";
	}	
}
