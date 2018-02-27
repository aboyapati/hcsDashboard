package com.tekvizion.hcs.cronjobs;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.tekvizion.hcs.util.DataMonitoringCronUtil;
import com.tekvizion.hcs.util.MonitorStatusConstants;


public class DataMonitoringCronScheduler {
	private static Logger logger = Logger.getLogger("rootLogger");

	@Autowired 
	private DataMonitoringCronUtil dataMonitoringCronUtil;
	
	/**
	 * This method retrieves the data from VM's and inserts into database for every 24 hours.
	 */
	public void retrieveAndUpdateMonitoredData(){
		logger.debug("Data Monitoring Cron started...");
		logger.debug("Calling the Data Monitoring Util class to execute the monitoring commands from Cron...");
		boolean executionStatus = dataMonitoringCronUtil.retrieveAndUpdateMonitoredData(MonitorStatusConstants.EXECUTION_FROM_CRON);
		logger.debug("The execution status to execute the CRON monitoring commands from util class is : "+executionStatus);
		if(executionStatus){
			logger.debug("Monitoring VM's process is already in progress");
		}
	}
	
}
