/**
 * 
 */
package com.tekvizion.hcs.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tekvizion.hcs.modal.Provisioning;
import com.tekvizion.hcs.service.ProvisioningService;
import com.tekvizion.hcs.service.TimeZoneService;
import com.tekvizion.hcs.service.UsersService;
 

/**
 * Handles requests for the provisioning page.
 */
@Controller
public class ProvisioningController {
	
	private static final Logger logger = LoggerFactory.getLogger("rootLogger");
	
	@Autowired
	private TimeZoneService timeZoneService;
	
	@Autowired
	private ProvisioningService provisioningService;
	
	@Autowired
	private UsersService usersService;
	
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
	 * Method to load the provisioning list page
	 * @param model,
	 * @param pId
	 * @return
	 */
	@RequestMapping(value = "/provisioning", method = RequestMethod.GET)
	public String getProvisioning(Model model, @RequestParam(required = false) String pId) {
		List<Provisioning> provisioningList = new ArrayList<Provisioning>();
		provisioningList = provisioningService.getProvisioningData();
		 
		model.addAttribute("provisioningList",provisioningList);
		model.addAttribute("timeZoneList",this.timeZoneService.listAllTimeZones());
		model.addAttribute("headerName","provisioning");

		return "provisioning";
	}
	/**
	 * Method to load the components page
	 * @param model,
	 * @param pId
	 * @return
	 */
	@RequestMapping(value = "/components", method = RequestMethod.GET)
	public String getComponents(Model model, @RequestParam(required = false) String pId) {
		
		return "redirect:component?componentId="+pId;
		 

		 
	}
}
