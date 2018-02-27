package com.tekvizion.hcs.exception;

public class MultipleUsersFoundException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7736277760738381250L;

	private String errMsg;

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	
}
