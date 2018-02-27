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
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.ComponentTypesEnum;
import com.tekvizion.hcs.util.UserTypeConstant;
import com.tekvizion.hcs.validator.RegexValidator;
/**
 * Handles requests for the component types page.
 */
@Controller
public class ComponentTypesController {

	private static Logger logger = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ComponentTypesService componentTypesService;
	
	@Autowired
	private DataCenterService dataCenterService;
	
	@Autowired
	private ComponentsService componentService;

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
	 * Method to load the Component Type page
	 * @param model
	 * @param dataCenterId
	 * @return
	 */
	@RequestMapping(value = "/componentType", method = RequestMethod.GET)
	public String getComponent(Model model,@RequestParam String dataCenterId) {
 
		String userName = getUserName();
		logger.info(userName+" - Loading componentTypes page.");
		List<ComponentTypes> componentTypesList =new ArrayList<ComponentTypes>();
		List<ComponentTypesEnum> componentTypesEnumlist = Arrays.asList(ComponentTypesEnum.values());
		model.addAttribute("componentTypesEnumlist", componentTypesEnumlist);
		
		DataCenter datacenter =this.dataCenterService.findById(dataCenterId);
		if(datacenter==null){
			logger.error(userName+" - Loading component type page. Invalid datacenter. datacenter id - "+dataCenterId);
			model.addAttribute("componentList",componentTypesList);
			model.addAttribute("userName",userName);
			model.addAttribute("dataCenterId",dataCenterId);
			model.addAttribute("headerName","componentType");
			return "componentTypes";
		}
		componentTypesList =this.componentTypesService.findByDataCenterId(datacenter.getId());
		model.addAttribute("dataCenterId",dataCenterId);
		model.addAttribute("userName",userName);
		if(componentTypesList.isEmpty()){
			componentTypesEnumlist = Arrays.asList(ComponentTypesEnum.values());
			model.addAttribute("componentTypesList",componentTypesList);
			model.addAttribute("headerName","componentType");
			model.addAttribute("dataCenterName",datacenter.getName());
			model.addAttribute("componentTypesEnumlist", componentTypesEnumlist);
			
			return "componentTypes";
		}
		 
		model.addAttribute("componentTypesList",componentTypesList);
		model.addAttribute("dataCenterName",datacenter.getName());
		model.addAttribute("headerName","componentType");
		return "componentTypes";
	}
	
	/**
	 * Method add a new componentType
	 *
	 * @param dataCenterId,
	 * @param type,
	 * @param version,
	 * @param subVersion,
	 * @param vrfMax,
	 * @param vrfWarnStart,
	 * @param vrfWarnEnd,
	 * @param bgpPeersMax,
	 * @param bgpPeersWarnStart,
	 * @param bgpPeersWarnEnd,
	 * @param vlanMax,
	 * @param vlanWarnStart,
	 * @param vlanWarnEnd,
	 * @param hsrpMax,
	 * @param hsrpWarnStart,
	 * @param hsrpWarnEnd,
	 * @param staticRoutesMax,
	 * @param staticRoutesWarnStart,
	 * @param staticRoutesWarnEnd
	 * @return
	 */
	@RequestMapping(value = "/componentType/add", method = RequestMethod.POST)
	@ResponseBody
	public String addComponentType(@RequestParam String dataCenterId,
							@RequestParam String type,
							@RequestParam String version,
							@RequestParam String subVersion,
							@RequestParam (required =false)String vrfMax,
							@RequestParam (required =false)String vrfWarnStart,
							@RequestParam (required =false)String vrfWarnEnd,
							@RequestParam (required =false)String bgpPeersMax,
							@RequestParam (required =false)String bgpPeersWarnStart,
							@RequestParam (required =false)String bgpPeersWarnEnd,
							@RequestParam (required =false)String vlanMax,
							@RequestParam (required =false)String vlanWarnStart,
							@RequestParam (required =false)String vlanWarnEnd,
							@RequestParam (required =false)String hsrpMax,
							@RequestParam (required =false)String hsrpWarnStart,
							@RequestParam (required =false)String hsrpWarnEnd,
							@RequestParam (required =false)String staticRoutesMax,
							@RequestParam (required =false)String staticRoutesWarnStart,
							@RequestParam (required =false)String staticRoutesWarnEnd) {
		
		String userName = getUserName();
		String userRole = getUserRole();

		if(userRole.equalsIgnoreCase(UserTypeConstant.role_customer_user) || userRole.equalsIgnoreCase(UserTypeConstant.role_provider_user)){
			logger.debug(userName+" - Failed to add a new component. The Logged in user doesnt have privileges to add component");
			return "Sorry..! User doesnt have privileges to add component";
		}
		if(dataCenterId==null || dataCenterId.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new Component type. Reason: dataCenterId is null or empty");
			return  "Not able to retrieve the DataCenter of the Component" ;
		}
		
		DataCenter dataCenter = this.dataCenterService.findById(dataCenterId);
		if (dataCenter == null) {
			logger.error(userName+" - Failed to add a new Component Type. Reason: Could not find the Data center. Id - "+dataCenterId);
			return  "Not able to retrieve the Data center details of the Component type" ;
		}

		logger.info(userName+" - *****************Validating component Form**************************");
		String error = this.componentTypeFormValidation(type, version, subVersion, vrfMax, vrfWarnStart, vrfWarnEnd, bgpPeersMax, bgpPeersWarnStart, bgpPeersWarnEnd, 
				vlanMax, vlanWarnStart, vlanWarnEnd, hsrpMax, hsrpWarnStart, hsrpWarnEnd, staticRoutesMax, staticRoutesWarnStart,
				staticRoutesWarnEnd);
		logger.info(userName+" - *****************Completed component form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}
				
		ComponentTypes componentType = this.componentTypesService.findByName(type);
		if(componentType!=null){
			logger.error(userName+" - Failed to add a new Component type. Reason: Component type already exists with same details. - "+type);
			return  "Cannot add this Component Type. Same Component type already exists.";
		}
			
		type = type.replaceAll("\\s+", " ").trim();

		componentType = new ComponentTypes();
		//componentType.setName(type);
		componentType.setVersion(version);
		componentType.setSubVersion(subVersion);
		componentType.setVrfWarnStart(vrfWarnStart);
		componentType.setVrfWarnEnd(vrfWarnEnd);
		componentType.setVrfMax(vrfMax);
		componentType.setBgpPeersWarnStart(bgpPeersWarnStart);
		componentType.setBgpPeersWarnEnd(bgpPeersWarnEnd);
		componentType.setBgpPeersMax(bgpPeersMax);
		componentType.setVlanWarnStart(vlanWarnStart);
		componentType.setVlanWarnEnd(vlanWarnEnd);
		componentType.setVlanMax(vlanMax);
		componentType.setHsrpWarnStart(hsrpWarnStart);
		componentType.setHsrpWarnEnd(hsrpWarnEnd);
		componentType.setHsrpMax(hsrpMax);
		componentType.setStaticRoutesWarnStart(staticRoutesWarnStart);
		componentType.setStaticRoutesWarnEnd(staticRoutesWarnEnd);
		componentType.setStaticRoutesMax(staticRoutesMax);
		componentType.setType(ComponentTypesEnum.valueOf(type));
		 
		componentType.setDataCenter(dataCenter);
		
		this.componentTypesService.add(componentType);
		logger.debug(userName+" - Component Type :  - "+type+" added");
		return  "success" ;
	}

	/**
	 * Method add a update componentType
	 *
	 * @param dataCenterId,
	 * @param type,
	 * @param version,
	 * @param subVersion,
	 * @param vrfMax,
	 * @param vrfWarnStart,
	 * @param vrfWarnEnd,
	 * @param bgpPeersMax,
	 * @param bgpPeersWarnStart,
	 * @param bgpPeersWarnEnd,
	 * @param vlanMax,
	 * @param vlanWarnStart,
	 * @param vlanWarnEnd,
	 * @param hsrpMax,
	 * @param hsrpWarnStart,
	 * @param hsrpWarnEnd,
	 * @param staticRoutesMax,
	 * @param staticRoutesWarnStart,
	 * @param staticRoutesWarnEnd
	 * @return
	 */
 
	@RequestMapping(value = "/componentType/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateComponentType(@RequestParam String id,
			@RequestParam String dataCenterId,
			@RequestParam String type,
			@RequestParam String version,
			@RequestParam String subVersion,
			@RequestParam (required =false)String vrfMax,
			@RequestParam (required =false)String vrfWarnStart,
			@RequestParam (required =false)String vrfWarnEnd,
			@RequestParam (required =false)String bgpPeersMax,
			@RequestParam (required =false)String bgpPeersWarnStart,
			@RequestParam (required =false)String bgpPeersWarnEnd,
			@RequestParam (required =false)String vlanMax,
			@RequestParam (required =false)String vlanWarnStart,
			@RequestParam (required =false)String vlanWarnEnd,
			@RequestParam (required =false)String hsrpMax,
			@RequestParam (required =false)String hsrpWarnStart,
			@RequestParam (required =false)String hsrpWarnEnd,
			@RequestParam (required =false)String staticRoutesMax,
			@RequestParam (required =false)String staticRoutesWarnStart,
			@RequestParam (required =false)String staticRoutesWarnEnd  
			 
			) {

		String userName = getUserName();

		if (id == null || id.trim().isEmpty()) {
			logger.debug(userName+" - Failed to modify the Component type. Reason: id is null or empty");
			return  "Could not update the Component. Please try again." ;
		}

		if(dataCenterId==null || dataCenterId.trim().isEmpty()){
			logger.debug(userName+" - Failed to add a new Component type. Reason: dataCenterId is null or empty");
			return  "Not able to retrieve the DataCenter of the Component" ;
		}
		
		DataCenter dataCenter = this.dataCenterService.findById(dataCenterId);
		if (dataCenter == null) {
			logger.error(userName+" - Failed to add a new Component type. Reason: Could not find the Data Center. Id - "+dataCenterId);
			return  "Not able to retrieve the DataCenter of the Component" ;
		}
		
		ComponentTypes componentTypes = this.componentTypesService.findById(id);
		if(componentTypes==null){
			logger.error(userName	+ " - Failed to modify the Component type. Reason: Could not find Component details");
			return  "Could not update the Component. Please try again." ;
		}

		logger.info(userName+" - *****************Validating component type form**************************");
		String error = this.componentTypeFormValidation(type, version, subVersion, vrfMax, vrfWarnStart, vrfWarnEnd, bgpPeersMax, bgpPeersWarnStart, bgpPeersWarnEnd, 
				vlanMax, vlanWarnStart, vlanWarnEnd, hsrpMax, hsrpWarnStart, hsrpWarnEnd, staticRoutesMax, 
				staticRoutesWarnStart, staticRoutesWarnEnd);
		logger.info(userName+" - *****************Completed component type form Validation****************");
		if(!error.equalsIgnoreCase("success")){
			return error;
		}
		Components component= this.componentService.findByComponentTypeId(componentTypes.getId());
		if(component!=null){
			if(!type.equalsIgnoreCase(componentTypes.getType().name())){
				logger.debug(userName+" - Failed to update a Component type. Reason: componentType is already associated with one of the component.");
				return  "Cannot modify this type.<br>Reason: It is associated with one or more components." ;
			}
		}	
		type = type.replaceAll("\\s+", " ").trim();
		version =version.replaceAll("\\s+", " ").trim();
		subVersion =subVersion.replaceAll("\\s+", " ").trim();
		componentTypes.setId(id);
		componentTypes.setVersion(version);
		componentTypes.setSubVersion(subVersion);
		componentTypes.setVrfWarnStart(vrfWarnStart);
		componentTypes.setVrfWarnEnd(vrfWarnEnd);
		componentTypes.setVrfMax(vrfMax);
		componentTypes.setBgpPeersWarnStart(bgpPeersWarnStart);
		componentTypes.setBgpPeersWarnEnd(bgpPeersWarnEnd);
		componentTypes.setBgpPeersMax(bgpPeersMax);
		componentTypes.setVlanWarnStart(vlanWarnStart);
		componentTypes.setVlanWarnEnd(vlanWarnEnd);
		componentTypes.setVlanMax(vlanMax);
		componentTypes.setHsrpWarnStart(hsrpWarnStart);
		componentTypes.setHsrpWarnEnd(hsrpWarnEnd);
		componentTypes.setHsrpMax(hsrpMax);
		componentTypes.setStaticRoutesWarnStart(staticRoutesWarnStart);
		componentTypes.setStaticRoutesWarnEnd(staticRoutesWarnEnd);
		componentTypes.setStaticRoutesMax(staticRoutesMax);
		componentTypes.setType(ComponentTypesEnum.valueOf(type));
		componentTypes.setDataCenter(dataCenter);

		this.componentTypesService.edit(componentTypes);
		
		logger.debug(userName+" - Component  type : Name - "+type+"   is updated");
		return  "success" ;
	}

	 /**
	 * Method to delete the ComponentType
	 * @param id
	 * @return
	 */ 

	@RequestMapping(value="/componentType/delete", method=RequestMethod.POST)
	@ResponseBody
	public String deleteComponentType(@RequestParam String id ){
		String userName = getUserName();

		if(id==null || id.length()==0){
			logger.debug(userName+" - Failed to delete the Component type. Reason: component id is null or empty");
			return "Component type not found. Please try again.";
		}
		
		Components component = this.componentService.findByComponentTypeId(id);
		if(component==null){
			logger.debug(userName+" - deleting the component type - "+id);
			this.componentTypesService.delete(id);
		}else{
			logger.debug(userName	+ " - Failed to delete the component type. Reason: this type is associated with one or components. ");
			return  "Could not delete this type.<br>Reason: It is associated with one or more components." ;
		}
		logger.info(userName+" - Component type deleted successfully. Id - "+id);
		return "success" ;
	} 
	
	/**
	 * Method to fetch the components with component type id.
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/componentType/getType", method = RequestMethod.POST)
	@ResponseBody
	public Object listPhoneLines(@RequestParam String id) {
		Map<String, Object> componentData = new HashMap<String,Object>();
		if(id == null || id.isEmpty()){
			logger.error("Failed to fetch components. Id is null. Returning empty list");
			return componentData;
		}
		Components component = this.componentService.findByComponentTypeId(id);
		if(component == null){
			logger.error("Component type is not associated with component.");
			componentData.put("associatedwithcomponenttype", false);
			 
		}else{
			logger.error("Component type is associated with component.");
			componentData.put("componenttype", component.getComponentType().getType().toString());
			componentData.put("associatedwithcomponenttype", true);
			 
		}
		return componentData;
	}
	 
	
	/**
	 * Method to validate create / update form data
	 * @param type,
	 * @param version,
	 * @param subVersion,
	 * @param vrfMax,
	 * @param vrfWarnStart,
	 * @param vrfWarnEnd,
	 * @param bgpPeersMax,
	 * @param bgpPeersWarnStart,
	 * @param bgpPeersWarnEnd,
	 * @param vlanMax,
	 * @param vlanWarnStart,
	 * @param vlanWarnEnd,
	 * @param hsrpMax,
	 * @param hsrpWarnStart,
	 * @param hsrpWarnEnd,
	 * @param staticRoutesMax,
	 * @param staticRoutesWarnStart,
	 * @param staticRoutesWarnEnd
	 * @return
	 */
	private String componentTypeFormValidation(String type, String version, String subVersion,
			 								String vrfMax, String vrfWarnStart, String vrfWarnEnd, 
			 								String bgpPeersMax, String bgpPeersWarnStart, String bgpPeersWarnEnd, 
			 								String vlanMax, String vlanWarnStart, String vlanWarnEnd, 
			 								String hsrpMax, String hsrpWarnStart, String hsrpWarnEnd, 
			 								String staticRoutesMax, String staticRoutesWarnStart, 
			 								String staticRoutesWarnEnd){

		String userName = getUserName();
		if(type == null || type.trim().isEmpty()){
			logger.debug(userName+" - Component type form validation failed. Reason: Type is null or empty");
			return  "Please select the type of the Component Type" ;
		}
		if(!type.equalsIgnoreCase(ComponentTypesEnum.NEXUS.name()) && !type.equalsIgnoreCase(ComponentTypesEnum.ASA.name()) 
				&& !type.equalsIgnoreCase(ComponentTypesEnum.VCENTER.name())){
			logger.debug(userName+" - Component type form validation failed. Reason: Component Type is not Valid");
			return  "Please select valid Component Type" ;
		}
		if(version == null || version.trim().isEmpty()){
			logger.debug(userName+" - Component type form validation failed. Reason: Version is null or empty");
			return  "Please specify the version of the Component Type" ;
		}
		if(!RegexValidator.validateAlphanumericWithDot(version)){
			logger.debug(userName+" - Component type form validation failed. Reason: Version contains special characters. version - "+version);
			return  "Sorry..! Version should not contain special charcters." ;
		}
		if(subVersion == null || subVersion.trim().isEmpty()){
			logger.debug(userName+" - Component type form validation failed. Reason: SubVersion is null or empty");
			return  "Please specify the Sub version of the Component Type" ;
		}if(!RegexValidator.validateAlphanumericWithDot(subVersion)){
			logger.debug(" - Failed to create a component type. Reason: subVersion contains special characters. subVersion - "+subVersion);
			return  "Sorry..! subVersion should not contain special charcters.";
		}

		if(ComponentTypesEnum.NEXUS.name().equalsIgnoreCase(type)){
			if(vrfMax != null){
				if(vrfMax.trim().isEmpty() || vrfMax.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: Vrf is null or empty");
					return  "Please specify the VRF Max of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vrfMax)){
					logger.debug(userName+" - Component type form validation failed. Reason: Vrf Max contains special characters. VrfMax - "+vrfMax);
					return  "Sorry..! VRF Max should not contain special charcters." ;
				}
				double result = Double.parseDouble(vrfMax)/100;
				if(RegexValidator.validateFloatAndDouble(String.valueOf(result))){
					logger.debug(userName+" - Component type form validation failed. Reason: Vrf Max value is not multiples of 100. VrfMax - "+vrfMax);
					return  "Sorry..! VRF Max value should be in multiples of 100." ;
				}			
			}
			if(vrfWarnStart != null){
				if(vrfWarnStart.trim().isEmpty() || vrfWarnStart.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: VrfWarnStart is null or empty");
					return  "Please specify the VRF Warning value of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vrfWarnStart)){
					logger.debug(userName+" - Component type form validation failed. Reason: VrfWarnStart contains special characters. VrfWarnStart - "+vrfWarnStart);
					return  "Sorry..! VRF Warning should not contain special charcters." ;
				}
			}
			if(vrfWarnEnd != null){
				if(vrfWarnEnd.trim().isEmpty() || vrfWarnEnd.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: VrfWarnEnd is null or empty");
					return  "Please specify the VRF Alert value of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vrfWarnEnd)){
					logger.debug(userName+" - Component type form validation failed. Reason: VrfWarnEnd contains special characters. VrfWarnEnd - "+vrfWarnEnd);
					return  "Sorry..! VRF Alert should not contain special charcters." ;
				}
			}
			if(bgpPeersMax != null){
				if(bgpPeersMax.trim().isEmpty() || bgpPeersMax.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: bgpPeers Max is null or empty");
					return  "Please specify the BGPPeers Max of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(bgpPeersMax)){
					logger.debug(userName+" - Component type form validation failed. Reason: BgpPeersMax contains special characters. bgpPeersMax - "+bgpPeersMax);
					return  "Sorry..! BGPPeers Max should not contain special charcters." ;
				}
				double result = Double.parseDouble(bgpPeersMax)/100;
				if(RegexValidator.validateFloatAndDouble(String.valueOf(result))){
					logger.debug(userName+" - Component type form validation failed. Reason: BGPPeers Max value is not multiples of 100. BGPPeers Max - "+bgpPeersMax);
					return  "Sorry..! BGPPeers Max value should be in multiples of 100." ;
				}
			}
			if(bgpPeersWarnStart != null){
				if(bgpPeersWarnStart.trim().isEmpty() || bgpPeersWarnStart.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: bgpPeersWarnStart is null or empty");
					return  "Please specify the BGPPeers Warning of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(bgpPeersWarnStart)){
					logger.debug(userName+" - Component type form validation failed. Reason: BgpPeers Warn Start contains special characters. bgpPeersWarnStart - "+bgpPeersWarnStart);
					return  "Sorry..! BGPPeers WarnS tartshould not contain special charcters." ;
				}
			}	
			if(bgpPeersWarnEnd != null){
				if(bgpPeersWarnEnd.trim().isEmpty() || bgpPeersWarnEnd.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: bgpPeersWarnEnd is null or empty");
					return  "Please specify the BGPPeers Alert of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(bgpPeersWarnEnd)){
					logger.debug(userName+" - Component type form validation failed. Reason: BgpPeersWarnEnd contains special characters. bgpPeers - "+bgpPeersWarnEnd);
					return  "Sorry..! BGPPeers Alert should not contain special charcters." ;
				}
			}	
			if(vlanMax != null){
				if(vlanMax.trim().isEmpty() || vlanMax.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: vlanMax  is null or empty");
					return  "Please specify the VLAN Max of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vlanMax)){
					logger.debug(userName+" - Component type form validation failed. Reason: vlanMax contains special characters. vlanMax - "+vlanMax);
					return  "Sorry..! VLAN Max should not contain special charcters." ;
				}
				double result = Double.parseDouble(vlanMax)/100;
				if(RegexValidator.validateFloatAndDouble(String.valueOf(result))){
					logger.debug(userName+" - Component type form validation failed. Reason: vlanMax value is not multiples of 100. vlanMax - "+vlanMax);
					return  "Sorry..! VLAN Max value should be in multiples of 100." ;
				}
			}
			if(vlanWarnStart != null){
				if(vlanWarnStart.trim().isEmpty() || vlanWarnStart.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: vlanWarnStart is null or empty");
					return  "Please specify the VLAN Warning of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vlanWarnStart)){
					logger.debug(userName+" - Component type form validation failed. Reason: vlanWarnStart contains special characters. vlanWarnStart - "+vlanWarnStart);
					return  "Sorry..! VLAN Warning should not contain special charcters." ;
				}
			}
			if(vlanWarnEnd != null){
				if(vlanWarnEnd.trim().isEmpty() || vlanWarnEnd.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: vlanWarnEnd is null or empty");
					return  "Please specify the VLAN Alert of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(vlanWarnEnd)){
					logger.debug(userName+" - Component type form validation failed. Reason: vlanWarnEnd contains special characters. vlanWarnEnd - "+vlanWarnEnd);
					return  "Sorry..! VLAN Alert should not contain special charcters." ;
				}
			}
			if(hsrpMax != null){
				if(hsrpMax.trim().isEmpty() || hsrpMax.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpMax is null or empty");
					return  "Please specify the HSRP Max of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(hsrpMax)){
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpMax contains special characters. hsrpMax - "+hsrpMax);
					return  "Sorry..! HSRP Max should not contain special charcters." ;
				}
				double result = Double.parseDouble(hsrpMax)/100;
				if(RegexValidator.validateFloatAndDouble(String.valueOf(result))){
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpMax value is not multiples of 100. hsrpMax - "+hsrpMax);
					return  "Sorry..! HSRP Max value should be in multiples of 100." ;
				}
			}
			if(hsrpWarnStart != null){
				if(hsrpWarnStart.trim().isEmpty() || hsrpWarnStart.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpWarnStart is null or empty");
					return  "Please specify the HSRP Warning of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(hsrpWarnStart)){
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpWarnStart contains special characters. hsrpWarnStart - "+hsrpWarnStart);
					return  "Sorry..! HSRP Warning should not contain special charcters." ;
				}
			}
			if(hsrpWarnEnd != null){
				if(hsrpWarnEnd.trim().isEmpty() || hsrpWarnEnd.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpWarnEnd is null or empty");
					return  "Please specify the HSRP Alert of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(hsrpWarnEnd)){
					logger.debug(userName+" - Component type form validation failed. Reason: hsrpWarnEnd contains special characters. hsrpWarnEnd - "+hsrpWarnEnd);
					return  "Sorry..! HSRP Alert should not contain special charcters." ;
				}
			}
			if(staticRoutesMax != null){
				if(staticRoutesMax.trim().isEmpty() || staticRoutesMax.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesMax is null or empty");
					return  "Please specify the StaticRoutes Max of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(staticRoutesMax)){
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesMax contains special characters. staticRoutesMax - "+staticRoutesMax);
					return  "Sorry..! StaticRoutes Max should not contain special charcters." ;
				}
				double result = Double.parseDouble(staticRoutesMax)/100;
				if(RegexValidator.validateFloatAndDouble(String.valueOf(result))){
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesMax value is not multiples of 100. staticRoutesMax - "+staticRoutesMax);
					return  "Sorry..! StaticRoutes Max value should be in multiples of 100." ;
				}
			}
			if(staticRoutesWarnStart != null){
				if(staticRoutesWarnStart.trim().isEmpty() || staticRoutesWarnStart.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesWarnStart is null or empty");
					return  "Please specify the StaticRoutes Warning of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(staticRoutesWarnStart)){
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesWarnStart contains special characters. staticRoutesWarnStart - "+staticRoutesWarnStart);
					return  "Sorry..! StaticRoutes Warning should not contain special charcters." ;
				} 
			}
			if(staticRoutesWarnEnd != null){
				if(staticRoutesWarnEnd.trim().isEmpty() || staticRoutesWarnEnd.equals("")){	
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesWarnEnd is null or empty");
					return  "Please specify the StaticRoutes Alert of the Component Type" ;
				}
				if(!RegexValidator.validateNumeric(staticRoutesWarnEnd)){
					logger.debug(userName+" - Component type form validation failed. Reason: staticRoutesWarnEnd contains special characters. staticRoutesWarnEnd - "+staticRoutesWarnEnd);
					return  "Sorry..! StaticRoutes Alert should not contain special charcters." ;
				} 
			}
		}
		 
		logger.info(userName+" - Component Type Form Validation Success. Component type - "+type);
		return "success";
	}
	
}
