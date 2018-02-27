package com.tekvizion.hcs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.DataMonitoringCronUtil;
import com.tekvizion.hcs.util.MonitorStatusConstants;

/**
 * Handles requests for the application admin page.
 */
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;
	
	@Autowired 
	private DataMonitoringCronUtil dataMonitoringCronUtil;
	
	/**
	 * Model attribute to display the user name
	 * @return
	 */
	@ModelAttribute("userName")
	public String getUserName() {
	   String userName = this.usersService.getAuthenticatedUserName();
	   return userName;
	}

	/**
	 * Model attribute to pass the role of authenticated user to UI
	 * @return
	 */
	@ModelAttribute("userRole")
	public String getUserRole() {
	   String userRole = this.usersService.getAuthenticatedUserRole();
	   return userRole;
	}

	/**
	 * Method to load the ondemand monitoring page
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/onDemandMonitoring", method = RequestMethod.GET)
	public String onDemandMonitoring(Model model) {
		logger.info("Welcome to Admin page");
		String userName = getUserName();
		model.addAttribute("headerName", "ondemandmonitoring" );
		return "ondemandmonitoring";
	}
	
	/**
	 * This method to monitoring ondemand
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/admin/startOnDemandMonitoring", method=RequestMethod.POST)
	@ResponseBody
	public String startOnDemandMonitoring(Model model) {
		String userName = getUserName();
		logger.debug("On Demand Data Monitoring started...");
		logger.debug("Calling the Data Monitoring Util class to execute the On Demand monitoring commands...");
		boolean executionStatus = dataMonitoringCronUtil.retrieveAndUpdateMonitoredData(MonitorStatusConstants.EXECUTION_ONDEMAND);
		logger.debug("The execution status to execute the On Demand monitoring commands from util class is : "+executionStatus);
		model.addAttribute("headerName", "ondemandmonitoring" );
		if(executionStatus){
			return "Monitoring VM's process is already in progress";
		}
		return "success";
	}
}
