package com.tekvizion.hcs.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.service.ComponentTypesService;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.DataCenterService;
import com.tekvizion.hcs.service.MonitoringService;
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.ComponentTypesEnum;
import com.tekvizion.hcs.util.MonitorStatusConstants;
import com.tekvizion.hcs.validator.RegexValidator;

/**
 * Handles requests for the components page.
 */
@Controller
public class ComponentsController {
	private static Logger logger = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ComponentsService componentService;
	
	@Autowired
	private ComponentTypesService componentTypesService;
	
	@Autowired
	private DataCenterService dataCenterService;
	
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
	 * Method to load the component page
	 * @param model
	 * @param dataCenterId
	 * @return
	 */
	@RequestMapping(value = "/component", method = RequestMethod.GET)
	public String getComponent(Model model,@RequestParam String dataCenterId) {
		String userName = getUserName();
		List<ComponentTypesEnum> componentTypesEnumlist = Arrays.asList(ComponentTypesEnum.values());
		model.addAttribute("componentTypesEnumlist", componentTypesEnumlist);
		List<Components> componentList =new ArrayList<Components>();
		DataCenter datacenter =this.dataCenterService.findById(dataCenterId);
		if(datacenter==null){
			logger.error(userName+" - Loading blank component page. Invalid datacenter. datacenter id - "+dataCenterId);
			model.addAttribute("componentList",componentList);
			model.addAttribute("userName",userName);
			model.addAttribute("dataCenterId",dataCenterId);
			model.addAttribute("headerName","component");
			return "component";
		}
		componentList =this.componentService.findByDataCenterId(datacenter.getId());
		 
		model.addAttribute("componentList",componentList);
		model.addAttribute("userName",userName);
		logger.debug(userName+" - Get component list size is - "+componentList.size());
		model.addAttribute("dataCenterId",dataCenterId);
		model.addAttribute("dataCenterName",datacenter.getName());
		model.addAttribute("headerName","component");
		return "component";
	}

	/**
	 * Method add a new component
	 *
	 * @param name
	 * @param componentTypeId
	 * @param dataCenterId
	 * @param ipAddress
	 * @param componentUser
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/component/add", method = RequestMethod.POST)
	@ResponseBody
	public String addComponent(@RequestParam String name,
							@RequestParam String componentTypeId,
							@RequestParam String dataCenterId,
							@RequestParam(required=false) String ipAddress,
							@RequestParam(required=false) String componentUser,
							@RequestParam(required=false) String password) {

		String userName = getUserName();
		
		if(componentTypeId==null || componentTypeId.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new Component. Reason: componentTypeId is null or empty");
			return  "Please select the Type of the Component" ;
		} 
		if(dataCenterId==null || dataCenterId.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new Component. Reason: dataCenterId is null or empty");
			return  "Not able to retrieve the DataCenter details of the Component" ;
		}
		DataCenter dataCenter = this.dataCenterService.findById(dataCenterId);
		if (dataCenter == null) {
			logger.error(userName+" - Failed to add a new Component. Reason: Could not find the Data Center. Id - "+dataCenterId);
			return  "Not able to retrieve the DataCenter details of the Component" ;
		}
		
		ComponentTypes componentType= this.componentTypesService.findById(componentTypeId);
		if (componentType == null) {
			logger.error(userName+" - Failed to add a new Component. Reason: Could not find the Component Type. Id - "+componentTypeId);
			return  "Please select the Component Type of the Component" ;
		}
		
		logger.debug(userName+" - *****************Validating component Form**************************");
		String error = this.componentFormValidation(name,ipAddress,componentUser,password);
		logger.debug(userName+" - *****************Completed component form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}

		Long componentCounts = this.componentService.findByNameAndIPAddress(name, ipAddress,dataCenterId);
		if(componentCounts>0){
			logger.error(userName+" - Failed to add a new Component. Reason: Component already exists with same details. name - "+name + "ipAddress :"+ipAddress);
			return  "Cannot add this Component. Same Component already exists.";
		}
		
		name = name.replaceAll("\\s+", " ").trim();
		Components component = new Components();
		component.setName(name);
		component.setComponentType(componentType);
		component.setDataCenter(dataCenter);
		component.setVersion(componentType.getVersion()+"-"+componentType.getSubVersion());
		component.setIpAddress(ipAddress);
		component.setUserName(componentUser);
		component.setPassword(password);
		component.setMonitorStatus(MonitorStatusConstants.GOOD);
		this.componentService.add(component);
		logger.debug(userName+" -Component created successfully. Component : Name - "+name);
		return  "success" ;
	}

	/**
	 * Method to update the details of a given component
	 *
	 * @param id
	 * @param name
	 * @param ipAddress
	 * @param componentUser
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/component/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateComponent(@RequestParam String id,
										@RequestParam String name,
										@RequestParam(required=false) String ipAddress,
										@RequestParam(required=false) String componentUser,
										@RequestParam(required=false) String password) {

		String userName = getUserName();
		if (id == null || id.trim().isEmpty()) {
			logger.debug(userName+" - Failed to modify the Component. Reason: id is null or empty");
			return  "Could not update the Component. Please try again." ;
		}

		Components component = this.componentService.findById(id);
		if(component==null){
			logger.error(userName	+ " - Failed to modify the Component. Reason: Could not find Component details");
			return  "Could not update the Component. Please try again." ;
		} 
		logger.debug(userName+" - updating component  - "+component.getName());
		logger.debug(userName+" - *****************Validating component Form**************************");
		String error = this.componentFormValidation(name,ipAddress,componentUser,password);
		logger.debug(userName+" - *****************Completed component form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}
		name = name.replaceAll("\\s+", " ").trim();
		component.setName(name);
		component.setIpAddress(ipAddress);
		component.setUserName(componentUser);
		component.setPassword(password);
		this.componentService.edit(component);
		
		logger.debug(userName+" - Component updated successfully, Component : Name - "+name);
		return  "success" ;
	}
	
	/**
	 * This method to fetch the component type version
	 * @param componentTypeId
	 * @param dataCenterId
	 * @return
	 */
	@RequestMapping(value = "/component/getVersion", method = RequestMethod.POST)
	@ResponseBody
	public Object getComponentVersion(@RequestParam String componenttype,@RequestParam String dataCenterId){
		String userName = getUserName();
		logger.debug(userName+" -componentType  - "+componenttype);
		
		Map<String, Object> componentVersionData = new HashMap<String,Object>();
		if (componenttype == null || componenttype.trim().isEmpty()) {
			logger.debug(userName+" - Failed to modify the Component. Reason: component type id is null or empty");
			return  "Could not get the Component version. Please try again." ;
		}
		
		List<ComponentTypes> componentType= this.componentTypesService.findByType(ComponentTypesEnum.valueOf(componenttype),dataCenterId );
		if (componentType.isEmpty()) {
			logger.error(userName+" - Failed to add a new Component. Reason: Could not find the Component Type - "+componenttype);
			return  "Please select the Type of the Component" ;
		}
		List<String> componentTypeVersionList =new ArrayList<String>();
		List<String> componentTypeIdList =new ArrayList<String>();
		for (ComponentTypes componentTypes : componentType) {
			componentTypeIdList.add(componentTypes.getId());
			componentTypeVersionList.add(componentTypes.getVersion()+"-"+componentTypes.getSubVersion());
		}
		componentVersionData.put("componentTypeIdList", componentTypeIdList);
		componentVersionData.put("componentTypeVersionList", componentTypeVersionList);
		logger.info(userName+" - Component Version size : - "+componentTypeVersionList.size());
		return componentVersionData;
	}

	/**
	 * Method to delete the component
	 * @param id
	 * @return
	 */

	@RequestMapping(value="/component/delete", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComponent(@RequestParam String id ){
		String userName = getUserName();
		
		if(id==null || id.length()==0){
			logger.error(userName+" - Failed to delete the Component. Reason: site id is null or empty");
			return "Component not found. Please try again.";
		}
		
		Components component = this.componentService.findById(id);
		if(component==null){
			logger.error(userName+" - Failed to delete the Component. Reason: Component not found. id - "+id);
			return  "Could not delete the Component. Please try again." ;
		}
		
		logger.debug(userName+" - deleting component  - "+component.getName());
		
		this.monitoringService.deleteNexusMonitoringByComponentId(component.getId());
		this.monitoringService.deleteAsaMonitoringByComponentId(component.getId());
		this.monitoringService.deleteVCenterMonitoringByComponentId(component.getId());
				
		this.componentService.delete(id);
		logger.info(userName+" - Component deleted successfully. Id - "+id);
		return "success" ;
	}
	
	/**
	 * Method to validate create / update form data
	 * @param name
	 * @param ipAddress
	 * @param componentUser
	 * @param password
	 * @return
	 */
	private String componentFormValidation(String name,String ipAddress,String componentUser,String password){

		String userName = getUserName();
		if(name == null || name.trim().isEmpty()){
			logger.debug(userName+" - Component form validation failed. Reason: Name is null or empty");
			return  "Please specify the name of the Component" ;
		}
		if(name.length()>100){
			logger.debug(userName+" - Component form validation failed. Reason: Name is too long");
			return  "Sorry..! Name should not contain more than 100 characters" ;
		}
		
		if(ipAddress != null && !ipAddress.trim().isEmpty()){
		if(ipAddress.trim().length()>15){
			logger.debug(userName+" - Component form validation failed. Reason: IP is too long");
			return  "Sorry..! IP should not contain more than 15 characters" ;
		}
		if(!RegexValidator.validateNumericWithDot(ipAddress)){
			logger.debug(userName+" - Component form validation failed. Reason: IP contains special characters. IP - "+ipAddress);
			return  "Sorry..! IP should not contain special characters / alphabets." ;
		}
		if(!RegexValidator.validateIPAddress(ipAddress)){
			logger.debug(userName+" - Component form validation failed. Reason: IP is invalid. IP - "+ipAddress);
			return  "Sorry..! IP is invalid." ;
		}
		}

		logger.info(userName+" - Component Form Validation Success. Component name - "+name);
		return "success";
	}
}
