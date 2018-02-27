package com.tekvizion.hcs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import com.google.gson.Gson;
import com.tekvizion.hcs.dto.AsaMonitoringDto;
import com.tekvizion.hcs.dto.ComponentsDto;
import com.tekvizion.hcs.dto.DataCenterDto;
import com.tekvizion.hcs.dto.NexusMonitoringDto;
import com.tekvizion.hcs.dto.VCenterMonitoringDto;
import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.DataCenterService;
import com.tekvizion.hcs.service.MonitoringService;
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.AppConstants;
import com.tekvizion.hcs.util.ComponentTypesEnum;
import com.tekvizion.hcs.util.ComponentsHistoryConstants;
import com.tekvizion.hcs.util.MonitorStatusConstants;

/**
 * Handles requests for the dashboard page.
 */
@Controller
public class DashboardController {

	private static Logger logger = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;

	@Autowired
	private DataCenterService dataCenterService;
	
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
	 * Method to load the dashboard page
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		String userName = getUserName();
		List<DataCenter> dataCenterList = dataCenterService.getAll();
		List<DataCenterDto> dataCenterDtoList = new ArrayList<DataCenterDto>();
		if(dataCenterList != null && !dataCenterList.isEmpty()){
			logger.debug(userName+ "Data Center List length : " + dataCenterList.size());
			for(DataCenter dataCenter:dataCenterList){
				DataCenterDto dataCenterDto=new DataCenterDto();
				dataCenterDto.setId(dataCenter.getId());
				List<Components> componentsList = componentService.findByDataCenterId(dataCenter.getId());
				logger.debug(userName+ "components List length : " + componentsList.size() + " for Data center. Id : "+dataCenter.getId());
				if(componentsList != null && !componentsList.isEmpty()){					
					boolean green = false;
					boolean orange = false;
					boolean red = false;
					for(Components component:componentsList){
						if(component.getMonitorStatus().equals(MonitorStatusConstants.BAD)){
							red = true;
						}else if(component.getMonitorStatus().equals(MonitorStatusConstants.NORMAL)){
							orange = true;
						}else{
							green = true;
						}
					}
					if(red){
						dataCenterDto.setStatus(MonitorStatusConstants.BAD);
						logger.debug(userName+ "MonitorStatus : " + MonitorStatusConstants.BAD + " for Data center. Id : "+dataCenter.getId());
					}else if(orange){
						dataCenterDto.setStatus(MonitorStatusConstants.NORMAL);
						logger.debug(userName+ "MonitorStatus : " + MonitorStatusConstants.NORMAL + " for Data center. Id : "+dataCenter.getId());
					}else{
						dataCenterDto.setStatus(MonitorStatusConstants.GOOD);
						logger.debug(userName+ "MonitorStatus : " + MonitorStatusConstants.GOOD + " for Data center. Id : "+dataCenter.getId());
					}
				}else{
					dataCenterDto.setStatus(MonitorStatusConstants.GOOD);
					logger.debug(userName+ "If Components are not avaiable,added MonitorStatus as : " + MonitorStatusConstants.GOOD + " for Data center. Id : "+dataCenter.getId());
				}
				dataCenterDto.setName(dataCenter.getName());
				dataCenterDtoList.add(dataCenterDto);
			}
		}
		model.addAttribute("dataCenterList",dataCenterDtoList);
		model.addAttribute("headerName", "dashboard");
		logger.debug(userName + " - visited Dashboard");
		return "dashboard";
	}
	
	/**
	 * Method to load the dataCenterDashboard page
	 * @param model
	 * @param dataCenterId
	 * @return
	 */
	@RequestMapping(value = "/dataCenterDashboard", method = RequestMethod.GET)
	public String getComponentList(Model model,@RequestParam String dataCenterId) {
		String userName = getUserName();
		if (dataCenterId == null || dataCenterId.trim().length() <= 0) {
			logger.debug(userName+ " Data Center Id is not present in the request");
			return "redirect:/dataCenterDashboard";  
		}
		DataCenter dataCenter=this.dataCenterService.findById(dataCenterId);
		if (dataCenter == null) {
			logger.debug(userName+ " Data Center is not available.");
			return "redirect:/dataCenterDashboard";  
		}
		List<Components> componentsList = this.componentService.findByDataCenterId(dataCenterId);
		List<ComponentsDto> componentsDtoList = new ArrayList<ComponentsDto>();
		logger.debug(userName+ "components List length : " + componentsList.size() + " for Data center. Id : "+dataCenterId);
		if(componentsList != null && !componentsList.isEmpty()){			
			for(Components component:componentsList){
				ComponentsDto componentDto=new ComponentsDto();
				componentDto.setId(component.getId());
				componentDto.setName(component.getName());
				componentDto.setWARN_START(70);
				componentDto.setWARN_END(90);
				componentDto.setMAX(100);
				if(component.getMonitorStatus().equals(MonitorStatusConstants.BAD)){
					componentDto.setValue(95);
				}else if(component.getMonitorStatus().equals(MonitorStatusConstants.NORMAL)){
					componentDto.setValue(80);
				}else{
					componentDto.setValue(35);
				}
				componentDto.setSTEP_VALUE(10);
				componentsDtoList.add(componentDto);
			}
			model.addAttribute("dashboardchartGraph",componentsDtoList);
			Gson gson = new Gson();
			String jsonLineGraphDataList = gson.toJson(componentsDtoList);
			model.addAttribute("chartGraph",jsonLineGraphDataList);
			logger.debug(" - Get component list size is - "+componentsList.size());
		}
		model.addAttribute("dataCenterId",dataCenterId);
		model.addAttribute("dataCenterName",dataCenter.getName());
		model.addAttribute("headerName","dashboard");
		return "dataCenterDashboard";
	}
	
	/**
	 * Method to load the componentDashboard page
	 * @param model
	 * @param componentId
	 * @return
	 */
	@RequestMapping(value = "/componentDashboard", method = RequestMethod.GET)
	public String getComponentDetails(Model model,@RequestParam String componentId) {
		Components component = this.componentService.findById(componentId);
		String userName = getUserName();
		ComponentTypes componentType = component.getComponentType();
		List<ComponentsDto> componentsDtoList = new ArrayList<ComponentsDto>();
		if(componentType != null){
			if(componentType.getType().equals(ComponentTypesEnum.NEXUS)){
				logger.debug(userName +" - Component type NEXUS in  componentDashboard...");
				NexusMonitoring nexusMonitoring = this.monitoringService.getLatestNexusMonitoringDataByComponentId(componentId);
				if(nexusMonitoring != null){
					logger.debug(userName +" - Adding Property VRF for component type NEXUS in  componentDashboard...");
					componentsDtoList.add(addNexusComponentData("VRF", componentType.getVrfWarnStart(), componentType.getVrfWarnEnd(), 
							componentType.getVrfMax(), nexusMonitoring.getVrfCount()));
					logger.debug(userName + " - Added Property VRF for component type NEXUS in  componentDashboard...");
					logger.debug(userName +" - Adding Property BGP PEERS for component type NEXUS in  componentDashboard...");
					componentsDtoList.add(addNexusComponentData("BGP PEERS", componentType.getBgpPeersWarnStart(), componentType.getBgpPeersWarnEnd(), 
							componentType.getBgpPeersMax(), nexusMonitoring.getTotalBgpPeers()));
					logger.debug(userName +" - Added Property BGP PEERS for component type NEXUS in  componentDashboard...");
					logger.debug(userName +" - Adding Property VLAN for component type NEXUS in  componentDashboard...");
					componentsDtoList.add(addNexusComponentData("VLAN", componentType.getVlanWarnStart(), componentType.getVlanWarnEnd(), 
							componentType.getVlanMax(), nexusMonitoring.getExistingVlans()));
					logger.debug(userName +" - Added Property VLAN for component type NEXUS in  componentDashboard...");
					logger.debug(userName +" - Adding Property HSRP for component type NEXUS in  componentDashboard...");
					componentsDtoList.add(addNexusComponentData("HSRP", componentType.getHsrpWarnStart(), componentType.getHsrpWarnEnd(), 
							componentType.getHsrpMax(), nexusMonitoring.getTotalHsrpEnabledInterfaces()));
					logger.debug(userName +" - Added Property HSRP for component type NEXUS in  componentDashboard...");
					logger.debug(userName +" - Adding Property Static Routes for component type NEXUS in  componentDashboard...");
					componentsDtoList.add(addNexusComponentData("Static Routes", componentType.getStaticRoutesWarnStart(), componentType.getStaticRoutesWarnEnd(), 
							componentType.getStaticRoutesMax(), nexusMonitoring.getStaticRoutesCount()));
					logger.debug(userName +" - Addied Property Static Routes for component type NEXUS in  componentDashboard...");
				}
			}
			
			if(componentType.getType().equals(ComponentTypesEnum.ASA)) {
				logger.debug(userName +" - Component type ASA in  componentDashboard...");
				AsaMonitoring asaMonitoring = this.monitoringService.getLatestAsaMonitoringDataByComponentId(componentId);
				if(asaMonitoring != null){
					logger.debug(userName +" - Adding Property SECURITY CONTEXT for component type ASA in  componentDashboard...");
					componentsDtoList.add(addVCenterComponentData("SECURITY CONTEXT", String.valueOf(asaMonitoring.getTotalActiveSecurityContexts()), String.valueOf(asaMonitoring.getTotalSecurityContexts())));
					logger.debug(userName +" - Adding Property SECURITY CONTEXT for component type ASA in  componentDashboard...");
				}
			}
			
			if(componentType.getType().equals(ComponentTypesEnum.VCENTER)){
				logger.debug(userName +" - Component type VCENTER in  componentDashboard...");
				VCenterMonitoring vCenterMonitoring = this.monitoringService.getLatestVCenterMonitoringDataByComponentId(componentId);
				if(vCenterMonitoring != null){
					logger.debug(userName +" - Adding Property MEMORY for component type VCENTER in  componentDashboard...");
			  		String totalMemory  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalMemory())/AppConstants.ONE_GB);
			  		logger.debug(userName +" - Total Memory for component type VCENTER in  componentDashboard in GB's : "+ totalMemory);
			  		String totalUsedMemory  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalUsedMemory())/AppConstants.ONE_GB);
			  		logger.debug(userName +" - Total Used Memory for component type VCENTER in  componentDashboard in GB's : "+ totalUsedMemory);
			  		logger.debug(userName +" - Adding Property MEMORY for component type VCENTER in  componentDashboard...");
					componentsDtoList.add(addVCenterComponentData("MEMORY", totalMemory, totalUsedMemory));
					
					long totalLogicalCores = Long.valueOf(vCenterMonitoring.getTotalLogicalCores());
					long totalUsedLogicalCoresOn = Long.valueOf(vCenterMonitoring.getTotalUsedLogicalCoresOn());
					if(totalUsedLogicalCoresOn > totalLogicalCores){
						totalUsedLogicalCoresOn = totalLogicalCores;
					}
					logger.debug(userName +" - Added Property MEMORY for component type VCENTER in  componentDashboard...");
					logger.debug(userName +" - Adding Property CORES for component type VCENTER in  componentDashboard...");
					componentsDtoList.add(addVCenterComponentData("CORES", String.valueOf(totalLogicalCores), String.valueOf(totalUsedLogicalCoresOn)));
					logger.debug(userName +" - AddedProperty CORES for component type VCENTER in  componentDashboard...");
					logger.debug(userName +" - Adding Property DATASTORE for component type VCENTER in  componentDashboard...");
			  		String totalDataStore  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalDatastore())/AppConstants.ONE_GB);
			  		logger.debug(userName +" - Total Datastore for component type VCENTER in  componentDashboard in GB's : "+ totalDataStore);
			  		String totalUsedDataStore  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalUsedDatastore())/AppConstants.ONE_GB); 
			  		logger.debug(userName +" - Total Used Datastore for component type VCENTER in  componentDashboard in GB's : "+ totalUsedDataStore);
					componentsDtoList.add(addVCenterComponentData("DATASTORE", totalDataStore, totalUsedDataStore));
					logger.debug(userName +" - Added Property DATASTORE for component type VCENTER in  componentDashboard...");
				}
			}
			
			model.addAttribute("dashboardchartGraph",componentsDtoList);
			Gson gson = new Gson();
			String jsonLineGraphDataList = gson.toJson(componentsDtoList);
			model.addAttribute("chartGraph",jsonLineGraphDataList);
			logger.debug(userName +" - Get component list size is - "+componentsDtoList.size());
		}

		model.addAttribute("dataCenterId",component.getDataCenter().getId());
		model.addAttribute("dataCenterName",component.getDataCenter().getName());
		model.addAttribute("componentId",componentId);
		model.addAttribute("componentName",component.getName());
		model.addAttribute("headerName","dashboard");
		return "componentDashboard";
	}
	
	/**
	 * Method to add the nexus component data
	 * @param name,
	 * @param warnStart,
	 * @param warnEnd,
	 * @param max,
	 * @param total
	 * @return
	 */
	private ComponentsDto addNexusComponentData(String name, String warnStart, String warnEnd, String max, int total){
		ComponentsDto componentDto = new ComponentsDto();
		componentDto.setName(name);
		componentDto.setWARN_START(Long.parseLong(warnStart));
		componentDto.setWARN_END(Long.parseLong(warnEnd));
		long maxValue = Long.valueOf(max);
		long step=maxValue/20;
		componentDto.setMAX(maxValue);
		componentDto.setSTEP_VALUE(step);
		componentDto.setValue(total); 
		
		return componentDto;
	}
	
	/**
	 * Method to add the vCenter/asa component data
	 * @param name,
	 * @param total,
	 * @param totalUsed
	 * @return
	 */
	private ComponentsDto addVCenterComponentData(String name, String total, String totalUsed){
		ComponentsDto componentDto = new ComponentsDto();
		componentDto.setName(name);
		total = total == null?"0":total;
		totalUsed = totalUsed == null?"0":totalUsed;
		long totalMemoryMax = Long.parseLong(total);
		long warnStart = (totalMemoryMax*70)/100;
		long warnEnd = (totalMemoryMax*90)/100;
		componentDto.setWARN_START(warnStart);
		componentDto.setWARN_END(warnEnd);
		long step=totalMemoryMax/10;
		componentDto.setMAX(totalMemoryMax);
		componentDto.setSTEP_VALUE(step);
		componentDto.setValue(Long.parseLong(totalUsed)); 
		
		return componentDto;
	}
	
	/**
	 * Method to load the componentDetailDashboard page
	 * @param model
	 * @param componentId,
	 * @param property,
	 * @param lastXDays
	 * @return
	 */
	@RequestMapping(value = "/componentDetailDashboard", method = RequestMethod.GET)
	public String getComponentDetailsDashboard(Model model,@RequestParam String componentId,@RequestParam String property, @RequestParam String lastXDays) {
		Components component = this.componentService.findById(componentId);
		getComponentDetailList(model,componentId,property,lastXDays,component);
		
		model.addAttribute("dataCenterId",component.getDataCenter().getId());
		model.addAttribute("dataCenterName",component.getDataCenter().getName());
		model.addAttribute("componentId",componentId);		
		model.addAttribute("componentName",component.getName());
		model.addAttribute("headerName","dashboard");
		model.addAttribute("property",property);
		List<String> componentsHistoryList = new ArrayList<String>();
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_3_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_6_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_9_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_12_MONTHS);	
		model.addAttribute("componentsHistoryList", componentsHistoryList);
		model.addAttribute("lastXDays",lastXDays);
		return "componentDetailDashboard";
	}
	
	/**
	 * Method to load the componentDetailDashboard page
	 * @param model
	 * @param componentId,
	 * @param property,
	 * @param lastXDays
	 * @return
	 */
	@RequestMapping(value = "/componentDetailList", method = RequestMethod.GET)
	@ResponseBody
	public Object getComponentDetailsList(Model model,@RequestParam String componentId,@RequestParam String property, @RequestParam String lastXDays) {
		Components component = this.componentService.findById(componentId);
		Map<String, Object> reportData = new HashMap<String, Object>();
		 
		reportData =getComponentDetailList(model,componentId,property,lastXDays,component);
		 Object xaxiesval =reportData.get("xAxisDataList");
		 List<String> xAxisData =new ArrayList<String>();
		String[] xAxiesPointvalues=xaxiesval.toString().replace("[","").replace("]","").replace("\'","").split(",");  
		if(xAxiesPointvalues.length>1){
		for(String xAxiesPointValue:xAxiesPointvalues){
			 xAxisData.add(xAxiesPointValue);
		}
		}else{
			String xAxiesPointValue=String.valueOf(xaxiesval.toString().replace("[","").replace("]","").replace("\'",""));  
			xAxisData.add(xAxiesPointValue);
		}
		reportData.put("xAxisDataList", xAxisData);
		List<String> componentsHistoryList = new ArrayList<String>();
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_3_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_6_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_9_MONTHS);
		componentsHistoryList.add(ComponentsHistoryConstants.LAST_12_MONTHS);	
		reportData.put("property", property);
		reportData.put("lastXDays", lastXDays);
		return reportData;
	}
	
	private Map<String, Object>  getComponentDetailList(Model model,String componentId, String property, String lastXDays,Components component){
		ComponentTypes componentType = component.getComponentType();
		String userName = getUserName();
		Map<String, Object> reportData = new HashMap<String, Object>();
		if(componentType != null){
			if(componentType.getType().equals(ComponentTypesEnum.NEXUS)){
				logger.debug(userName +" - Component type NEXUS in  componentDetailDashboard...");
				NexusMonitoring nexusMonitoring = this.monitoringService.getLatestNexusMonitoringDataByComponentId(componentId);
				List<NexusMonitoringDto> nexusMonitoringDtoList = this.monitoringService.getLatestLimitedNexusMonitoringDataByComponentId(componentId, lastXDays);
				if(nexusMonitoring != null && (nexusMonitoringDtoList != null && !nexusMonitoringDtoList.isEmpty())){
					if(property.equalsIgnoreCase("VRF")){
						logger.debug(userName +" - Property VRF component type NEXUS in  componentDetailDashboard...");
						reportData = addNexusSubComponentsData(nexusMonitoringDtoList, model, property, componentType.getVrfMax(), nexusMonitoring.getVrfCount());
					
					}else if(property.equalsIgnoreCase("BGP PEERS")){
						logger.debug(userName +" - Property HSBGP PEERSRP component type NEXUS in  componentDetailDashboard...");
						reportData = addNexusSubComponentsData(nexusMonitoringDtoList, model, property, componentType.getBgpPeersMax(), nexusMonitoring.getTotalBgpPeers());
					
					}else if(property.equalsIgnoreCase("VLAN")){
						logger.debug(userName +" - Property VLAN component type NEXUS in  componentDetailDashboard...");
						reportData = addNexusSubComponentsData(nexusMonitoringDtoList, model, property, componentType.getVlanMax(), nexusMonitoring.getExistingVlans());
					
					}else if(property.equalsIgnoreCase("HSRP")){
						logger.debug(userName +" - Property HSRP component type NEXUS in  componentDetailDashboard...");
						reportData = addNexusSubComponentsData(nexusMonitoringDtoList, model, property, componentType.getHsrpMax(), nexusMonitoring.getTotalHsrpEnabledInterfaces());
					
					}else if(property.equalsIgnoreCase("Static Routes")){
						logger.debug(userName +" - Property Static Routes component type NEXUS in  componentDetailDashboard...");
						reportData = addNexusSubComponentsData(nexusMonitoringDtoList, model, property, componentType.getStaticRoutesMax(), nexusMonitoring.getStaticRoutesCount());
					}
				}
			}
		
			if(componentType.getType().equals(ComponentTypesEnum.ASA)){
				logger.debug(userName +" - Component type ASA in  componentDetailDashboard...");
				AsaMonitoring asaMonitoring = this.monitoringService.getLatestAsaMonitoringDataByComponentId(componentId);
				List<AsaMonitoringDto> asaMonitoringDtoList = this.monitoringService.getLatestLimitedAsaMonitoringDataByComponentId(componentId, lastXDays);
				if(asaMonitoring != null && (asaMonitoringDtoList != null && !asaMonitoringDtoList.isEmpty())){
					reportData = addASASubComponentsData(asaMonitoringDtoList, model, property, String.valueOf(asaMonitoring.getTotalActiveSecurityContexts()), String.valueOf(asaMonitoring.getTotalSecurityContexts()));
				}
			}
			
			if(componentType.getType().equals(ComponentTypesEnum.VCENTER)){
				logger.debug(userName +" - Component type VCENTER in  componentDetailDashboard...");
				VCenterMonitoring vCenterMonitoring = this.monitoringService.getLatestVCenterMonitoringDataByComponentId(componentId);
				logger.debug(userName +" - vCenterMonitoring object is : "+vCenterMonitoring);
				List<VCenterMonitoringDto> vCenterMonitoringDtoList = this.monitoringService.getLatestLimitedVCenterMonitoringDataByComponentId(componentId, lastXDays);
				logger.debug(userName +" - vCenterMonitoringDtoList size...."+vCenterMonitoringDtoList.size());
				if(vCenterMonitoring != null && (vCenterMonitoringDtoList != null && !vCenterMonitoringDtoList.isEmpty())){
					if(property.equalsIgnoreCase("MEMORY")){
						logger.debug(userName +" - Property MEMORY component type VCENTER in  componentDetailDashboard...");
				  		String totalMemory  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalMemory())/AppConstants.ONE_GB);
				  		logger.debug(userName +" - Total Memory for component type VCENTER in  componentDetailDashboard in GB's : "+ totalMemory);
				  		String totalUsedMemory  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalUsedMemory())/AppConstants.ONE_GB);
				  		logger.debug(userName +" - Total Used Memory for component type VCENTER in  componentDetailDashboard in GB's : "+ totalUsedMemory);
				  		reportData = addVCenterSubComponentsData(vCenterMonitoringDtoList, model, property, totalMemory, totalUsedMemory);
					
					}else if(property.equalsIgnoreCase("CORES")){
						logger.debug(userName +" - Property CORES component type VCENTER in  componentDetailDashboard...");
						long totalLogicalCores = Long.valueOf(vCenterMonitoring.getTotalLogicalCores());
						long totalUsedLogicalCoresOn = Long.valueOf(vCenterMonitoring.getTotalUsedLogicalCoresOn());
						if(totalUsedLogicalCoresOn > totalLogicalCores){
							totalUsedLogicalCoresOn = totalLogicalCores;
						}
						reportData = addVCenterSubComponentsData(vCenterMonitoringDtoList, model, property, String.valueOf(totalLogicalCores), String.valueOf(totalUsedLogicalCoresOn));
					
					}else if(property.equalsIgnoreCase("DATASTORE")){
						logger.debug(userName +" - Property DATASTORE component type VCENTER in  componentDetailDashboard...");
				  		String totalDataStore  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalDatastore())/AppConstants.ONE_GB);
				  		logger.debug(userName +" - Total Datastore for component type VCENTER in  componentDetailDashboard in GB's : "+ totalDataStore);
				  		String totalUsedDataStore  = String.valueOf(Long.parseLong(vCenterMonitoring.getTotalUsedDatastore())/AppConstants.ONE_GB); 
				  		logger.debug(userName +" - Total Used Datastore for component type VCENTER in  componentDetailDashboard in GB's : "+ totalUsedDataStore);
				  		reportData = addVCenterSubComponentsData(vCenterMonitoringDtoList, model, property, totalDataStore, totalUsedDataStore);
					}
				}
			}
		}
		return reportData;
	}
	/**
	 * Method to add the nexus sub components data
	 * @param nexusMonitoringDtoList,
	 * @param model,
	 * @param property,
	 * @param maxValue,
	 * @param total
	 * @return
	 */
	private Map<String, Object> addNexusSubComponentsData(List<NexusMonitoringDto> nexusMonitoringDtoList, Model model, String property, String maxValue, int total){
		double consumed = 0.0;
		double avail = 0.0;
		List<String> xAxisData =new ArrayList<String>();
		List<String> yAxisData =new ArrayList<String>();
		Map<String, Object> reportData = new HashMap<String, Object>();
		double value = total; //fetched from monitoring table
		double max = Double.valueOf(maxValue);
		consumed = (value/max);
		consumed = consumed*100;
		avail = 100 - consumed;
		model.addAttribute("avail",Math.round(avail));
		model.addAttribute("consumed",Math.round(consumed));
		model.addAttribute("totalUsed",Math.round(value));
		model.addAttribute("totalAvailableMemory",Math.round(max-value));
		SimpleDateFormat format = new SimpleDateFormat("MMM");
		if(property.equalsIgnoreCase("VRF")){
			for(NexusMonitoringDto monitoring: nexusMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double vrfCount = max - monitoring.getVrfCount();
				yAxisData.add(String.valueOf(Math.round(vrfCount)));
			}
		}else if(property.equalsIgnoreCase("BGP PEERS")){
			for(NexusMonitoringDto monitoring: nexusMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double totalBGPPeers = max - monitoring.getTotalBgpPeers();
				yAxisData.add(String.valueOf(Math.round(totalBGPPeers)));
			}
		}else if(property.equalsIgnoreCase("VLAN")){
			for(NexusMonitoringDto monitoring: nexusMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double existingVlans = max - monitoring.getExistingVlans();
				yAxisData.add(String.valueOf(Math.round(existingVlans)));
			}
		}else if(property.equalsIgnoreCase("HSRP")){
			for(NexusMonitoringDto monitoring: nexusMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double totalHsrpEnabledInterfaces = max - monitoring.getTotalHsrpEnabledInterfaces();
				yAxisData.add(String.valueOf(Math.round(totalHsrpEnabledInterfaces)));
			}
		}else if(property.equalsIgnoreCase("Static Routes")){
			for(NexusMonitoringDto monitoring: nexusMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double staticRoutesCount = max - monitoring.getStaticRoutesCount();
				yAxisData.add(String.valueOf(Math.round(staticRoutesCount)));
			}
		}
		reportData.put("avail", Math.round(avail));
		reportData.put("consumed", Math.round(consumed));
		reportData.put("totalUsed",Math.round(value));
		reportData.put("totalAvailableMemory",Math.round(max-value));
		
		reportData.put("xAxisDataList", xAxisData);
		reportData.put("yAxisDataList", yAxisData);
		model.addAttribute("xAxisDataList", xAxisData);
		model.addAttribute("yAxisDataList",yAxisData);
		return reportData;
	}
	
	/**
	 * Method to add the vCenter sub components data
	 * @param nexusMonitoringDtoList,
	 * @param model,
	 * @param property,
	 * @param totalValue,
	 * @param usedValue
	 * @return
	 */
	private Map<String, Object> addVCenterSubComponentsData(List<VCenterMonitoringDto> vCenterMonitoringDtoList, Model model, String property, String totalValue, String usedValue){
		double consumed = 0.0;
		double avail = 0.0;
		List<String> xAxisData =new ArrayList<String>();
		List<String> yAxisData =new ArrayList<String>();
		Map<String, Object> reportData = new HashMap<String, Object>();
		double value = Double.valueOf(usedValue); //fetched from monitoring table
		double max = Double.valueOf(totalValue);
		consumed = (value/max);
		consumed = consumed*100;
		avail = 100 - consumed;
		model.addAttribute("avail",Math.round(avail));
		model.addAttribute("consumed",Math.round(consumed));
		model.addAttribute("totalUsed",Math.round(value));
		model.addAttribute("totalAvailableMemory",Math.round(max-value));
		SimpleDateFormat format = new SimpleDateFormat("MMM");
		if(property.equalsIgnoreCase("MEMORY")){
			for(VCenterMonitoringDto monitoring: vCenterMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
		  		String totalUsedMemoryInGBs  = String.valueOf(Long.parseLong(monitoring.getTotalUsedMemory())/AppConstants.ONE_GB);
				double totalUsedMemory = max - Long.valueOf(totalUsedMemoryInGBs);
				yAxisData.add(String.valueOf(totalUsedMemory));
			}
		
		}else if(property.equalsIgnoreCase("CORES")){
			for(VCenterMonitoringDto monitoring: vCenterMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				long totalLogicalCores = Long.valueOf(monitoring.getTotalLogicalCores());
				long totalUsedLogicalCoresOn = Long.valueOf(monitoring.getTotalUsedLogicalCoresOn());
				
				if(totalUsedLogicalCoresOn > totalLogicalCores){
					totalUsedLogicalCoresOn = totalLogicalCores;
				}
				double totalUsedLogicalCores = max - totalUsedLogicalCoresOn;
				yAxisData.add(String.valueOf(totalUsedLogicalCores));
			}
		
		}else if(property.equalsIgnoreCase("DATASTORE")){
			for(VCenterMonitoringDto monitoring: vCenterMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
		  		String totalUsedDataStoreInGBs  = String.valueOf(Long.parseLong(monitoring.getTotalUsedDatastore())/AppConstants.ONE_GB); 
				double totalUsedDatastore = max - Long.valueOf(totalUsedDataStoreInGBs);
				yAxisData.add(String.valueOf(totalUsedDatastore));
			}
		}
		reportData.put("avail", Math.round(avail));
		reportData.put("consumed", Math.round(consumed));
		reportData.put("totalUsed",Math.round(value));
		reportData.put("totalAvailableMemory",Math.round(max-value));
		reportData.put("xAxisDataList", xAxisData);
		reportData.put("yAxisDataList", yAxisData);
		model.addAttribute("xAxisDataList", xAxisData);
		model.addAttribute("yAxisDataList",yAxisData);
		return reportData;
	}
	
	/**
	 * Method to add the asa sub components data
	 * @param nexusMonitoringDtoList,
	 * @param model,
	 * @param property,
	 * @param totalValue,
	 * @param usedValue
	 * @return
	 */
	private Map<String, Object> addASASubComponentsData(List<AsaMonitoringDto> asaMonitoringDtoList, Model model, String property, String totalValue, String usedValue){
		double consumed = 0.0;
		double avail = 0.0;
		List<String> xAxisData =new ArrayList<String>();
		List<String> yAxisData =new ArrayList<String>();
		Map<String, Object> reportData = new HashMap<String, Object>();
		double value = Double.valueOf(usedValue); //fetched from monitoring table
		double max = Double.valueOf(totalValue);
		consumed = (value/max);
		consumed = consumed*100;
		avail = 100 - consumed;
		model.addAttribute("avail",Math.round(avail));
		model.addAttribute("consumed",Math.round(consumed));
		model.addAttribute("totalUsed",Math.round(value));
		model.addAttribute("totalAvailableMemory",Math.round(max-value));
		SimpleDateFormat format = new SimpleDateFormat("MMM");
		for(AsaMonitoringDto monitoring: asaMonitoringDtoList){
				xAxisData.add("'"+format.format(monitoring.getMonitoringTimestamp())+"'");
				double totalSecurityContexts = max - monitoring.getTotalSecurityContexts();
				//yAxisData.add(String.valueOf(monitoring.getTotalSecurityContexts()));
				
				yAxisData.add(String.valueOf(Math.round(totalSecurityContexts)));
		}
		reportData.put("avail", Math.round(avail));
		reportData.put("consumed", Math.round(consumed));
		reportData.put("totalUsed",Math.round(value));
		reportData.put("totalAvailableMemory",Math.round(max-value));
		reportData.put("xAxisDataList", xAxisData);
		reportData.put("yAxisDataList", yAxisData);
		model.addAttribute("xAxisDataList", xAxisData);
		model.addAttribute("yAxisDataList",yAxisData);
		return reportData;
	}
}
