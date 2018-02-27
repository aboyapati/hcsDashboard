package com.tekvizion.hcs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tekvizion.hcs.dto.AsaMonitoringDto;
import com.tekvizion.hcs.dto.ComponentsDto;
import com.tekvizion.hcs.dto.DataCenterDto;
import com.tekvizion.hcs.dto.NexusMonitoringDto;
import com.tekvizion.hcs.dto.NexusMonitoringVrfAvgDto;
import com.tekvizion.hcs.dto.VCenterMonitoringDto;
import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.ComponentData;
import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.modal.DataCenterComponent;
import com.tekvizion.hcs.modal.MonitoringVrfAvgComponentData;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.service.ComponentTypesService;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.DataCenterService;
import com.tekvizion.hcs.service.MonitoringService;
import com.tekvizion.hcs.service.UsersService;
import com.tekvizion.hcs.util.AppConstants;
import com.tekvizion.hcs.util.ComponentTypesEnum;
import com.tekvizion.hcs.util.ComponentsHistoryConstants;
import com.tekvizion.hcs.util.MonitorStatusConstants;

/**
 * Handles requests for the new dashboard page.
 */
@RestController
@RequestMapping("/newdashboard")
public class RestDashboardController {

	private static Logger logger = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;

	@Autowired
	private DataCenterService dataCenterService;
	
	@Autowired
	private ComponentsService componentService;
	
	@Autowired
	private ComponentTypesService componentTypesService;
	
	@Autowired
	private MonitoringService monitoringService;
	
	/**
	 * 
	 * @return
	 */
	public String getUserName() {
	   String userName = this.usersService.getAuthenticatedUserName();
	   return userName;
	}

	/**
	 * 
	 * @return
	 */
	public String getUserRole() {
	   String userRole = this.usersService.getAuthenticatedUserRole();
	   return userRole;
	}
	
	/**
	 * Service to display the data of all data centers
	 * @return List<DataCenter>
	 */
	
	@GetMapping("/dataCenterList")
	public List<DataCenter> dataCenterList() {	
		String userName = getUserName();
		List<DataCenter> dataCenterList = dataCenterService.getAll();
		return dataCenterList;
	
	}
	
	/**
	 * Service to display the component data for a datacenter. This will return datacenter information
	 * component types data and component data
	 * @param id
	 * @return List<Components> 
	 */
	@GetMapping("/dataCenterComponentList/{id}")
	public List<Components> dataCenterComponentList(@PathVariable String id) {	
		String userName = getUserName();
		List<Components> componentsList = componentService.findByDataCenterId(id);
		return componentsList;
	
	}
	
	/**
	 * Service to display the component data for a datacenter
	 * @param id
	 * @return List<Components> 
	 */
	@GetMapping("/avgNexusMonitoringVrfCountDataByComponentId/{componentId}/{lastXDays}")
	public List<NexusMonitoringVrfAvgDto> avgNexusMonitoringVrfCountDataByComponentId(@PathVariable String componentId,@PathVariable String lastXDays) {	
		String userName = getUserName();
		List<NexusMonitoringVrfAvgDto>  nexusMonitoringVrfAvgDto = monitoringService.avgNexusMonitoringVrfCountDataByComponentId(componentId, lastXDays);
		return nexusMonitoringVrfAvgDto;
	
	}
	
	/**
	 * Service to display the avg Nexus Monitoring Vrf count for all Nexus components
	 * in all data centers. This is handled for 3,6,9 and 12 months
	 * @param lastXDays // "Last 3 Months"
	 * @return List<MonitoringVrfAvgComponentData>
	 */
	@GetMapping("/getAllAvgNexusMonitoringVrfCountDataByComponentId/{lastXDays}")
	public List<MonitoringVrfAvgComponentData> getAllAvgNexusMonitoringVrfCountDataByComponentId(@PathVariable String lastXDays) {	
		List<MonitoringVrfAvgComponentData> monitoringVrfAvgComponentDataLst = new ArrayList<MonitoringVrfAvgComponentData>();
		String userName = getUserName();
		List<DataCenter> dataCenterList = dataCenterList();
		if(dataCenterList != null && !dataCenterList.isEmpty()){
			logger.debug(userName+ "Data Center List length : " + dataCenterList.size());
			//Iterate through each data centers
			for(DataCenter dataCenter:dataCenterList){
				//Get the component data for each datacenter
				List<Components> componentsList = dataCenterComponentList(dataCenter.getId());
				MonitoringVrfAvgComponentData monitoringVrfAvgComponentData = null;
				if(componentsList != null && !componentsList.isEmpty()){
					//Iterate through each components
						for(Components component:componentsList){
							monitoringVrfAvgComponentData = new MonitoringVrfAvgComponentData();
							//Set the component data
							ComponentData componentData = new ComponentData();
							componentData.setId(component.getId());
							componentData.setComponentTypeId(component.getComponentType().getId());
							componentData.setMonitorStatus(component.getMonitorStatus());
							componentData.setName(component.getName());
							
							//Set the component data
							//Take only the nexus components for time being
							if(component.getName().toLowerCase().contains("NEXUS".toLowerCase())) {
								List<NexusMonitoringVrfAvgDto>  nexusMonitoringVrfAvgDtoLst = monitoringService.avgNexusMonitoringVrfCountDataByComponentId(component.getId(), lastXDays);
								//Return an list with avg value 0 for each month if no entry found in database
								List<NexusMonitoringVrfAvgDto>  nexusMonitoringVrfAvgDtoLstNew = getOrderedVrfAvgList(nexusMonitoringVrfAvgDtoLst,lastXDays);
								monitoringVrfAvgComponentData.setComponentData(componentData);
								monitoringVrfAvgComponentData.setNexusMonitoringVrfAvgDtoLst(nexusMonitoringVrfAvgDtoLstNew);
								monitoringVrfAvgComponentDataLst.add(monitoringVrfAvgComponentData);
							}
							
						}
						
					}
			}
			
		}
		
		return monitoringVrfAvgComponentDataLst;
	
	}
	
	/**
	 * Method to return ordered Vrf Avg list. Will return avg as 0 if no entries are found
	 * This is handled for 3,6,9 and 12 months
	 * @param List<NexusMonitoringVrfAvgDto> // This is the list returned from the database
	 * @param lastXDays // "Last 3 Months"
	 * @return List<MonitoringVrfAvgComponentData>
	 */
	private List<NexusMonitoringVrfAvgDto> getOrderedVrfAvgList(List<NexusMonitoringVrfAvgDto> lst,String lastXDays) {
	  List<NexusMonitoringVrfAvgDto> objLst = new ArrayList<NexusMonitoringVrfAvgDto>();
	  
	  NexusMonitoringVrfAvgDto nexusMonitoringVrfAvgDto = null;
	  
	  final Calendar toDate = Calendar.getInstance();
	  final Calendar fromDate = Calendar.getInstance();
	  
	  int toYear = toDate.get(Calendar.YEAR);
	  int toMonth = toDate.get(Calendar.MONTH) + 1;
	  int toDay = toDate.get(Calendar.DAY_OF_MONTH);

	  if(ComponentsHistoryConstants.LAST_3_MONTHS.equals(lastXDays)){
		  fromDate.add(Calendar.MONTH, -3);

	  }else if(ComponentsHistoryConstants.LAST_6_MONTHS.equals(lastXDays)){
		  fromDate.add(Calendar.MONTH, -6);

	  }else if(ComponentsHistoryConstants.LAST_9_MONTHS.equals(lastXDays)){
		  fromDate.add(Calendar.MONTH, -9);

	  }else if(ComponentsHistoryConstants.LAST_12_MONTHS.equals(lastXDays)){
		  fromDate.add(Calendar.MONTH, -12);
	  }
	  
	  int fromYear = fromDate.get(Calendar.YEAR);
	  int fromMonth = fromDate.get(Calendar.MONTH) + 1;
	  int fromDay = fromDate.get(Calendar.DAY_OF_MONTH);
	  
	  fromDate.add(Calendar.MONTH, 1);
	  while( !fromDate.after(toDate)){
		  
		  // Do Work Here
		  nexusMonitoringVrfAvgDto = new NexusMonitoringVrfAvgDto();
		  fromYear = fromDate.get(Calendar.YEAR);
		  fromMonth = fromDate.get(Calendar.MONTH) + 1;
		  fromDay = fromDate.get(Calendar.DAY_OF_MONTH);
		  nexusMonitoringVrfAvgDto.setMonth(fromMonth);
		  nexusMonitoringVrfAvgDto.setYear(fromYear);
		  nexusMonitoringVrfAvgDto.setVrfAvgCount(0.00);
		  objLst.add(nexusMonitoringVrfAvgDto);
		  fromDate.add(Calendar.MONTH, 1);

	  }
	  //Iterate through the list
 	 for (NexusMonitoringVrfAvgDto temp : objLst) {
		  
		 for (NexusMonitoringVrfAvgDto existingData : lst) {
			 if(temp.getMonth() == existingData.getMonth() && temp.getYear() == existingData.getYear()) {
				  temp.setVrfAvgCount(existingData.getVrfAvgCount());
			  }
		  }
	}
	  return objLst;
	}
	
	/**
	 * Service to display the all data center component list
	 * @return List<DataCenterComponent> 
	 */
	@GetMapping("/allDataCenterComponentList")
	public List<DataCenterComponent> allDataCenterComponentList() {	
		String userName = getUserName();
		List<DataCenterComponent> dataCenterComponentlst = new ArrayList<DataCenterComponent>();
		DataCenterComponent dataCenterComponent = null;
		List<DataCenter> dataCenterList = dataCenterList();
		if(dataCenterList != null && !dataCenterList.isEmpty()){
			logger.debug(userName+ "Data Center List length : " + dataCenterList.size());
			//Iterate through each data centers
			for(DataCenter dataCenter:dataCenterList){
				dataCenterComponent = new DataCenterComponent();
				logger.debug("Data Center : " + dataCenter.getId() + " " + dataCenter.getName());
				dataCenterComponent.setId(dataCenter.getId());
				dataCenterComponent.setCountry(dataCenter.getCountry());
				dataCenterComponent.setName(dataCenter.getName());
				dataCenterComponent.setCity(dataCenter.getCity());
				dataCenterComponent.setState(dataCenter.getState());
				
				//Get the component data for each datacenter
				List<Components> componentsList = dataCenterComponentList(dataCenter.getId());
				logger.debug(userName+ "components List length : " + componentsList.size() + " for Data center. Id : "+dataCenter.getId());
				List<ComponentData> componentDataLst = new ArrayList<ComponentData>();
				ComponentData componentData = null;
				if(componentsList != null && !componentsList.isEmpty()){
					//Iterate through each components
					for(Components component:componentsList){
						logger.debug(userName+ "Components : " + component.getId() + "" + component.getComponentType() + "-" + component.getName() + "-" + component.getMonitorStatus());
						componentData = new ComponentData();
						componentData.setId(component.getId());
						componentData.setComponentTypeId(component.getComponentType().getId());
						componentData.setMonitorStatus(component.getMonitorStatus());
						componentData.setName(component.getName());
						componentDataLst.add(componentData);
						dataCenterComponent.setComponentData(componentDataLst);
					}
					
				}
				dataCenterComponentlst.add(dataCenterComponent);
				
			}
		}
		
		
		
		return dataCenterComponentlst;
	
	}
}
