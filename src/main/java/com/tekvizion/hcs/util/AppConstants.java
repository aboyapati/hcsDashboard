
package com.tekvizion.hcs.util;

import org.apache.commons.lang3.SystemUtils;

/**
 * Class to hold all the static constants
 * @author btadiboyina
 */
public class AppConstants {
	public static final String HCS_HOME = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard";
	public static final String HCS_CONF = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"conf";
	public static final String HCS_BIN = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"bin";
	public static final String HCS_VCENTER_SCRIPTS = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"scripts";
	public static final String HCS_TMP = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"tmp";
	public static final String HCS_RPT = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"report";
	public static final String HCS_RPT_VCENTER = SystemUtils.FILE_SEPARATOR+"home"+SystemUtils.FILE_SEPARATOR+"hcsdashboard"+SystemUtils.FILE_SEPARATOR+"report"+SystemUtils.FILE_SEPARATOR+"vcenter";
	public static final String HCS_EXECUTE_SCRIPT = "hcs.pl";
	public static final String HCS_REPORT_FILE = "report.rpt";
	public static final String HCS_EXECUTE_SERVER_COMMAND = " --server ";
	public static final String HCS_EXECUTE_USERNAME_COMMAND = " --username ";
	public static final String HCS_EXECUTE_PASSWORD_COMMAND = " --password ";
	public static final String HCS_EXECUTE_REPORT_COMMAND = " --type vcenter --report ";
		
	
	public static final String INTERRUPT_REASON_FAILED_TO_CONNECT = "Failed to reach the vCenter application.";
	public static final String INTERRUPT_REASON_FAILED_TO_GET_STATUS = "Failed to fetch the status.";
	
	public static final String CMD_GREP_PID = "grep PID ";
	public static final String CMD_GREP= "grep ";
	public static final String PIPE_SYMBOL= "|";
	public static final String CMD_KILL = "kill ";
	
	public static final long ONE_GB = 1073741824;
}
