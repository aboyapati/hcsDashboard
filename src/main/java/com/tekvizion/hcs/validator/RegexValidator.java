package com.tekvizion.hcs.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexValidator {
	/**
	 * REGEX string to validate e-mail address format
	 */
	public static final String EMAIL_REGEX = "^[_A-Za-z0-9~!$%^&*-+}{\'?=]+(\\.[_A-Za-z0-9~!$%^&*-+}{\'?=]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,4})$";

	/**
	 * REGEX string to validate alphanumeric format
	 * This patter will allow space
	 */
	public static final String ALPHANUMERIC_REGEX = "^[0-9a-zA-Z\\s]*$";
	/**
	 * REGEX string to validate alphanumeric and _ accept
	 * This patter will allow space
	 */
	public static final String ALPHANUMERIC_WITH_UNDERSCQURE_REGEX = "^[0-9a-zA-Z_]*$";

	/**
	 * REGEX string to validate alphanumeric with special characters format
	 */
	public static final String ALPHANUMERIC_WITH_SPECIAL_CHARACTERS_REGEX = "^[ A-Za-z0-9_@./#&+-]*$";

	public static final String VALIDATION_SUCCESS = "success";
	
	/**
	 * REGEX string to validate number
	 */
	public static final String NUMERIC_REGEX = "^[0-9]*$";
	
	/**
	 * REGEX string to validate number
	 */
	public static final String NUMERIC_REGEX_FOR_LINES = "^[0-9#*]*$";
	
	/**
	 * REGEX string to validate Number with DOT
	 */
	public static final String NUMERIC_REGEX_WITH_DOT = "^[0-9.]*$";
	
	public static final String FLOAT_AND_DOUBLE_REGEX = "^[0-9]+(\\.[1-9]+)*$";
	
	/**
	 * REGEX String to validate alphanumeric with special characters dot & @
	 */
	public static final String ALPHANUMERIC_REGEX_WITH_DOT_AND_AT = "^[0-9a-zA-Z\\s@.]*$";
	
	/**
	 * REGEX String to validate alphanumeric with special characters dot
	 */
	public static final String ALPHANUMERIC_REGEX_WITH_DOT = "^[0-9a-zA-Z\\s.]*$";
	
	public static final String ALPHANUMERIC_REGEX_WITH_DOT_AND_SPECIALCHARACTERS = "^[ A-Za-z0-9_.#,-]*$";
	
	/**
	 * REGEX string to validate Number with DOT And Comma
	 */
	public static final String NUMERIC_REGEX_WITH_DOT_COMMA = "^[0-9.,]*$";
	
	
	/**
	 * REGEX string to validate number
	 */
	public static final String REGEX_FOR_FILE_NAME = "^[\\\\/.]*";
	/**
	 * REGEX string to validate IP Address format
	 */
	private static final String IP_ADDRESS_REGEX =
			"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
			"([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
			"([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
			"([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";

	/**
	 * REGEX string to validate Password
	 */
	private static final String PASSWORD_REGEX =
            "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{4,20})";

	public static String validateEmailAddress(String email){

		if(!email.trim().equals("")&&!email.matches(EMAIL_REGEX)){
			return email.trim();
		}
		return VALIDATION_SUCCESS;
	}

	public static boolean validateAlphanumeric(String value){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_REGEX);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	public static boolean validateAlphanumericWithSpecialCharacters(String value){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_WITH_SPECIAL_CHARACTERS_REGEX);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	public static boolean validateNumeric(String value){
		Pattern pattern = Pattern.compile(NUMERIC_REGEX);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	public static boolean validateNumericForLines(String value){
		Pattern pattern = Pattern.compile(NUMERIC_REGEX_FOR_LINES);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	public static boolean validateNumericWithDot(String value){
		Pattern pattern = Pattern.compile(NUMERIC_REGEX_WITH_DOT);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	public static boolean validateFloatAndDouble(String value){
		Pattern pattern = Pattern.compile(FLOAT_AND_DOUBLE_REGEX);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	/* Ticket: 510
	Desc: Currently the UI does not allow alpha numeric and special characters, like dot and dash, etc.
	 Allow the followings:
		 A through Z
		 0 through 9
		 , . - _ # and space
		 
	Fix: Changed validation like allowed the special characters. 
	Author: Bala */
	public static boolean validateAlphanumericWithDotAndSPECIALCHARACTERS(String value){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_REGEX_WITH_DOT_AND_SPECIALCHARACTERS);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	public static boolean validateAlphanumericWithDotAndAT(String value){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_REGEX_WITH_DOT_AND_AT);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	public static boolean validateAlphanumericWithDot(String value){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_REGEX_WITH_DOT);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	public static boolean validateIPAddress(String ipAddress){
		Pattern pattern = Pattern.compile(IP_ADDRESS_REGEX);
		Matcher matcher = pattern.matcher(ipAddress);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	public static boolean validatePassword(String password){
		Pattern pattern = Pattern.compile(PASSWORD_REGEX);
		Matcher matcher = pattern.matcher(password);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	public static boolean validateFileName(String fileName){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_REGEX);
		Matcher matcher = pattern.matcher(fileName);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	public static boolean validateFileNameWithUnderSqure(String fileName){
		Pattern pattern = Pattern.compile(ALPHANUMERIC_WITH_UNDERSCQURE_REGEX);
		Matcher matcher = pattern.matcher(fileName);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	public static boolean validateNumericWithDotAndComma(String fileName){
		Pattern pattern = Pattern.compile(NUMERIC_REGEX_WITH_DOT_COMMA);
		Matcher matcher = pattern.matcher(fileName);
		if (matcher.matches()) {
			return true;
		}
		return false;
	}

}
