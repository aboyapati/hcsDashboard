package com.tekvizion.hcs.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.modal.TimeZones;
import com.tekvizion.hcs.service.ComponentTypesService;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.DataCenterService;
import com.tekvizion.hcs.service.MonitoringService;
import com.tekvizion.hcs.service.TimeZoneService;
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.UserTypeConstant;
import com.tekvizion.hcs.validator.RegexValidator;

/**
 * Handles requests for the data center page.
 */
@Controller
public class DataCenterController {

	private static Logger logger = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;

	@Autowired
	private TimeZoneService timeZoneService;
	
	@Autowired
	private DataCenterService dataCenterService;
	
	@Autowired
	private ComponentTypesService componentTypesService;
	
	@Autowired
	private ComponentsService componentService;
	
	@Autowired
	private MonitoringService monitoringService;
	
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
	 * Method to load the DataCenter page
	 * @param model
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/dataCenter", method = RequestMethod.GET)
	public String getDataCenter(Model model,@RequestParam String customerId) {
 
		String userName = getUserName();
		logger.info(userName+" - Loading data center page.");
		
		model.addAttribute("timeZoneList",this.timeZoneService.listAllTimeZones());		
		model.addAttribute("headerName","dataCenter");
		return "createDataCenter";
	}

	/**
	 * Method add a new dataCenter
	 *
	 * @param name
	 * @param country
	 * @param state
	 * @param city
	 * @param timeZoneId
	 * @return
	 */
	@RequestMapping(value = "/dataCenter/add", method = RequestMethod.POST)
	@ResponseBody
	public String addDataCenter(@RequestParam String name,
							@RequestParam String country,
							@RequestParam String state,
							@RequestParam String city,
							@RequestParam String timeZoneId) {
		
		String userName = getUserName();
		String userRole = getUserRole();
		logger.debug(userName+" - Trying to add a new Data center.");
		if(userRole.equalsIgnoreCase(UserTypeConstant.role_customer_user) || userRole.equalsIgnoreCase(UserTypeConstant.role_provider_user)){
			logger.debug(userName+" - Failed to add a new data center. The Logged in user doesnt have privileges to add data center");
			return "Sorry..! User doesnt have privileges to add datacenter";
		}

		logger.info(userName+" - *****************Validating data center Form**************************");
		String error = this.dataCenterFormValidation(name, country, state, city);
		logger.info(userName+" - *****************Completed data center form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}
		
		if(timeZoneId==null || timeZoneId.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new dataCenter. Reason: TimeZoneId is null or empty");
			return  "Please select the Time Zone of the Datacenter" ;
		}
		TimeZones timeZoneObj= this.timeZoneService.findById(timeZoneId);
		if (timeZoneObj == null) {
			logger.error(userName+" - Failed to add a new datacenter. Reason: Could not find the timeZone. Id - "+timeZoneId);
			return  "Please select the Time Zone of the Datacenter" ;
		}
		
		DataCenter dataCenter = dataCenterService.findByName(name);
		if(dataCenter!=null){
			logger.error(userName+" - Failed to add a new dataCenter. Reason: Datacenter already exists with same details. name - "+name);
			return  "Cannot add this datacenter. Same dataCenter already exists.";
		}
			
		name = name.replaceAll("\\s+", " ").trim();
		state = state.replaceAll("\\s+", " ").trim();
		city = city.replaceAll("\\s+", " ").trim();
		country = country.replaceAll("\\s+", " ").trim();
		
		dataCenter=new DataCenter();
		dataCenter.setName(name);
		dataCenter.setState(state);
		dataCenter.setCity(city);
		dataCenter.setCountry(country);
		dataCenter.setTimeZone(timeZoneObj);
		
		this.dataCenterService.add(dataCenter);
		logger.debug(userName+" - Datacenter : Name - "+name+" added");
		return  "success" ;
	}

	/**
	 * Method to update the details of a given dataCenter
	 *
	 * @param id
	 * @param name
	 * @param country
	 * @param state
	 * @param city
	 * @param timeZoneId
	 * @return
	 */
	@RequestMapping(value = "/dataCenter/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateDataCenter(@RequestParam String id,
										@RequestParam String name,
										@RequestParam String country,
										@RequestParam String state,
										@RequestParam String city,
										@RequestParam String timeZoneId) {

		String userName = getUserName();
		logger.debug(userName+" - Trying to modify a existing datacenter. id - "+id);

		if (id == null || id.trim().isEmpty()) {
			logger.debug(userName+" - Failed to modify the datacenter. Reason: id is null or empty");
			return  "Could not update the datacenter. Please try again." ;
		}
		DataCenter dataCenter = this.dataCenterService.findById(id);
		if(dataCenter==null){
			logger.error(userName	+ " - Failed to modify the dataCenter. Reason: Could not find dataCenter details");
			return  "Could not update the datacenter. Please try again." ;
		}

		logger.info(userName+" - *****************Validating DataCenter Form**************************");
		String error = this.dataCenterFormValidation(name, country, state, city);
		logger.info(userName+" - *****************Completed Datacenter form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}

		if(timeZoneId==null || timeZoneId.trim().isEmpty()){
			logger.debug(userName+" - Failed to modify the dataCenter. Reason: TimeZoneId is null or empty");
			return  "Please specify the Time Zone of the Datacenter" ;
		}
		TimeZones timeZoneObj = this.timeZoneService.findById(timeZoneId);
		if (timeZoneObj == null) {
			logger.error(userName+" - Failed to modify the dataCenter. Reason: Could not find the timeZone. Id - "+timeZoneId);
			return  "Please specify the Time Zone of the Datacenter" ;
		}
		
		name = name.replaceAll("\\s+", " ").trim();
		state = state.replaceAll("\\s+", " ").trim();
		city = city.replaceAll("\\s+", " ").trim();
		country = country.replaceAll("\\s+", " ").trim();
		
		dataCenter.setName(name);
		dataCenter.setState(state);
		dataCenter.setCity(city);
		dataCenter.setCountry(country);
		dataCenter.setTimeZone(timeZoneObj);

		dataCenterService.edit(dataCenter);
		logger.debug(userName+" - Datacenter : Name - "+name+"   is updated");
		return  "success" ;
	}

	/**
	 * Method to delete the Datacenter
	 * @param id
	 * @return
	 */

	@RequestMapping(value="/dataCenter/delete", method=RequestMethod.POST)
	@ResponseBody
	public String deleteDataCenter(@RequestParam String id ){
		String userName = getUserName();
		logger.debug(userName+" - Trying to delete the existing dataCenter");
		String userRole = getUserRole();
		if(userRole.equalsIgnoreCase(UserTypeConstant.role_customer_user) || userRole.equalsIgnoreCase(UserTypeConstant.role_provider_user)){
			logger.debug(userName+" - Failed to delete the dataCenter. The Logged in user doesnt have privileges to delete dataCenter");
			return "Sorry..! User doesnt have privileges to delete datacenter";
		}
		
		if(id==null || id.length()==0){
			logger.debug(userName+" - Failed to delete the dataCenter. Reason: site id is null or empty");
			return "Datacenter not found. Please try again.";
		}
		DataCenter  dataCenter=this.dataCenterService.findById(id);
		if(dataCenter==null){
			logger.debug(userName+" - Failed to delete the dataCenter. Reason: Datacenter not found. id - "+id);
			return  "Could not delete the dataCenter. Please try again." ;
		}
		
		List<Components> componentsList = this.componentService.findByDataCenterId(id);
		for(Components component : componentsList){			
						
			this.monitoringService.deleteNexusMonitoringByComponentId(component.getId());
			this.monitoringService.deleteAsaMonitoringByComponentId(component.getId());
			this.monitoringService.deleteVCenterMonitoringByComponentId(component.getId());
					
			this.componentService.delete(component.getId());			
		}	
				
		this.componentTypesService.deleteByDataCenterId(id);
				
		this.dataCenterService.delete(id);
		
		logger.info(userName+" - Deleted dataCenter successfully. Id - "+id);
		return "success" ;
	}
	
	/**
	 * Method to validate create / update form data
	 * @param name
	 * @param city
	 * @param zipCode
	 * @param country
	 * @return
	 */
	private String dataCenterFormValidation(String name, String country, String state, String city){

		String userName = getUserName();
		if(name == null || name.trim().isEmpty()){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: Name is null or empty");
			return  "Please specify the name of the Data Center" ;
		}
		if(name.length()>100){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: Name is too long");
			return  "Sorry..! Name should not contain more than 100 characters" ;
		}		

		if(country == null || country.trim().isEmpty() || country.trim().equalsIgnoreCase("--select--")){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: Country is null or empty");
			return "Please specify the country of the Data Center" ;
		}
		
		if(state == null || state.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new Data Center. Reason: State is null or empty");
			return "Please specify the state of the Data Center" ;
		}
		if(state.length()>50){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: State is too long");
			return  "Sorry..! State should not contain more than 50 characters" ;
		}
		if(!RegexValidator.validateAlphanumeric(state)){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: State contains special characters. State - "+state);
			return  "Sorry..! State should not contain special charcters." ;
		}

		if(city == null || city.trim().isEmpty()){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: City is null or empty");
			return  "Please specify the city of the Data Center" ;
		}
		if(city.length()>50){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: City is too long");
			return  "Sorry..! City should not contain more than 50 characters" ;
		}

		if(!RegexValidator.validateAlphanumeric(city)){
			logger.debug(userName+" - Data Center Form Validation Failed. Reason: City contains special characters. City - "+city);
			return  "Sorry..! City should not contain special charcters." ;
		}

		logger.info(userName+" - Data Center Form Validation Success. Data Center name - "+name);
		return "success";
	}
}
