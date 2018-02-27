package com.tekvizion.hcs.cronjobs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.SystemUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.MonitoringService;
import com.tekvizion.hcs.util.AppConstants;
import com.tekvizion.hcs.util.ComponentTypesEnum;
import com.tekvizion.hcs.util.MonitorStatusConstants;


public class VCenterMonitoringDataParserCron {
	private static Logger logger = Logger.getLogger("rootLogger");
	public static final String VCenter = "VCENTER";

	@Autowired
	private MonitoringService monitoringService;
	
	@Autowired
	private ComponentsService componentsService;
	
	
	/**
	 * This method retrieves the data from report file and inserts into database for every 24 hours.
	 */
	public void retrieveAndParseVCenterMonitoredData(){
		logger.debug("Parse VCenter Monitoring Data Cron started...");
		List<Components> componentsList = componentsService.findByComponentType(ComponentTypesEnum.VCENTER);
		if(componentsList.isEmpty()){
			logger.debug("vCenter components are not available...");
			return;
		}
		for(Components component :  componentsList){
			boolean green = false;
			boolean orange = false;
			boolean red = false;
			long warnStart = 0;
			long warnEnd = 0;
	    	
			logger.debug("Trying to parse monitoring data for vCenter Component. id : " + component.getId());
    		VCenterMonitoring vCenterMonitoring = this.retrieveVCenterMonitoringData(component);
			if(vCenterMonitoring == null){
	    		logger.debug("No monitoring data available for vCenter Component. id : " + component.getId() );
				 vCenterMonitoring = new VCenterMonitoring();
		  		 vCenterMonitoring.setReportDate(new Date());	
		  		 vCenterMonitoring.setServerIpAddress("0");		  		 
		  		 vCenterMonitoring.setTotalClusters(0);
				 vCenterMonitoring.setTotalBlades(0);    			 
		  		 vCenterMonitoring.setTotalCores("0");		  		
		  		 vCenterMonitoring.setTotalLogicalCores("0");		  		
		  		 vCenterMonitoring.setTotalUsedLogicalCoresAll("0");
		  		 vCenterMonitoring.setTotalUsedLogicalCoresOn("0");        		 
		  		 vCenterMonitoring.setTotalMemory("0");		  		
		  		 vCenterMonitoring.setTotalUsedMemory("0");		  		
		  		 vCenterMonitoring.setTotalMemoryLeft("0");		  		
		  		 vCenterMonitoring.setTotalVMs(0);		  		
		  		 vCenterMonitoring.setTotalOnVMs(0);		  		
		  		 vCenterMonitoring.setTotalDatastore("0");		  		
		  		 vCenterMonitoring.setTotalUsedDatastore("0");		  		
		  		 vCenterMonitoring.setTotalFreeDatastore("0");
		  		 vCenterMonitoring.setComponentReachable(false);
		  		 vCenterMonitoring.setMonitoringTimestamp(new Date());
		  		 vCenterMonitoring.setComponent(component);
		 		 monitoringService.addVCenterMonitoring(vCenterMonitoring);
				break;
			}
			
			long totalMemoryMax = Long.parseLong(vCenterMonitoring.getTotalMemory());
			long totalUsedMemory = Long.parseLong(vCenterMonitoring.getTotalUsedMemory());
			warnStart = (totalMemoryMax*70)/100;
			warnEnd = (totalMemoryMax*90)/100;
			if(totalUsedMemory < warnStart){
				green = true;
			}else if(totalUsedMemory > warnEnd){
				red = true;
			}else{
				orange = true;
			}
			
			long totalLogicalCores = Long.valueOf(vCenterMonitoring.getTotalLogicalCores());
			long totalUsedLogicalCoresOn = Long.valueOf(vCenterMonitoring.getTotalUsedLogicalCoresOn());			
			totalMemoryMax = Long.parseLong(String.valueOf(totalLogicalCores));
			totalUsedMemory = Long.parseLong(String.valueOf(totalUsedLogicalCoresOn));
			warnStart = (totalMemoryMax*70)/100;
			warnEnd = (totalMemoryMax*90)/100;
			if(totalUsedMemory < warnStart){
				green = true;
			}else if(totalUsedMemory > warnEnd){
				red = true;
			}else{
				orange = true;
			}
			
			totalMemoryMax = Long.parseLong(vCenterMonitoring.getTotalDatastore());
			totalUsedMemory = Long.parseLong(vCenterMonitoring.getTotalUsedDatastore());
			warnStart = (totalMemoryMax*70)/100;
			warnEnd = (totalMemoryMax*90)/100;
			if(totalUsedMemory < warnStart){
				green = true;
			}else if(totalUsedMemory > warnEnd){
				red = true;
			}else{
				orange = true;
			}
    		
			if(red){
				component.setMonitorStatus(MonitorStatusConstants.BAD);
				this.componentsService.edit(component);
			}else if(orange){
				component.setMonitorStatus(MonitorStatusConstants.NORMAL);
				this.componentsService.edit(component);
			}else{
				component.setMonitorStatus(MonitorStatusConstants.GOOD);
				this.componentsService.edit(component);
			}
			logger.debug("Added monitoring data status for vCenter Component. id : " + component.getId());
    		break;
		}	
	}

	private VCenterMonitoring retrieveVCenterMonitoringData(Components component){
		String reportDirectoryPath = AppConstants.HCS_RPT_VCENTER + SystemUtils.FILE_SEPARATOR + component.getDataCenter().getId()+ SystemUtils.FILE_SEPARATOR + component.getId();
		File reportDirectory = new File(reportDirectoryPath);
	
		String reportFileName = reportDirectory + SystemUtils.FILE_SEPARATOR + "report.rpt";		

		VCenterMonitoring vCenterMonitoring = parseVCenterMonitoringData(reportFileName);
		if(vCenterMonitoring==null) {
			logger.debug("Monitoring data is not available for vCenter Component. id : " + component.getId());
			return null;
		}
		vCenterMonitoring.setComponentReachable(true);
		vCenterMonitoring.setMonitoringTimestamp(new Date());
		vCenterMonitoring.setComponent(component);
		monitoringService.addVCenterMonitoring(vCenterMonitoring);
		logger.debug("Added monitoring data for VCenter Component. id : " + component.getId());
		return vCenterMonitoring;
	}
	
	/**
	 * Method to parse the report file of VCenterMonitoring and read the details
	 * @param vCenterMonitoring
	 * @return
	 */
	private VCenterMonitoring parseVCenterMonitoringData(String reportFileName){
		logger.debug("Parsing vCenter Monitoring Data Output..."); 
		String line;
        VCenterMonitoring vCenterMonitoring = new VCenterMonitoring();
	    try{
	    	File reportFile = new File(reportFileName);
	    	 if(!reportFile.exists() || reportFile.length()==0){
	    		 logger.error("either vCenter report file doesnt exist or exists but data is not available.. File Name - "+reportFileName);
   			  	 return null;
   		  	 }	    	     	

             BufferedReader br = new BufferedReader(new FileReader(reportFile));
             String label;
             String value;

             while((line = br.readLine()) != null){
            	 String split[] = line.split("\\:", 2);
            	 label = split[0].trim();
            	 value = split[1].trim();
            	 switch (label) {
			  	 	case "Report Date":
	         	  		DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss yyyy");
	        			try{
		        			Date date = (Date)formatter.parse(value);
		        			SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
		        			if(!fmt.format(date).equals(fmt.format(new Date()))){
		        				 logger.error("vCenter report file is not a latest file. File Name - "+reportFileName);
		           			  	 return null;
		        			}
		        			vCenterMonitoring.setReportDate(date);
	        			}catch(ParseException e){
	        				e.printStackTrace();
	        			}
	        			break;
				  	case "Server":
				  		 vCenterMonitoring.setServerIpAddress(value);
				  		 break;
				  	case "Total Clusters":
				  		 vCenterMonitoring.setTotalClusters(Integer.valueOf(value));
				  		 break;
            		case "Total Blades":
            			 vCenterMonitoring.setTotalBlades(Integer.valueOf(value));
            			 break;
				  	case "Total Cores":
				  		vCenterMonitoring.setTotalCores(value);
				  		break;
				  	case "Total Logical Cores":
				  		vCenterMonitoring.setTotalLogicalCores(value);
				  		break;
				  	case "Total Logical Cores Used All/On":
	            		 vCenterMonitoring.setTotalUsedLogicalCoresAll(value.split("\\/")[0]);
	            		 vCenterMonitoring.setTotalUsedLogicalCoresOn(value.split("\\/")[1]);
	            		 break;
				  	case "Total Memory":
				  		vCenterMonitoring.setTotalMemory(value);
				  		break;
				  	case "Total Memroy Used":
				  		vCenterMonitoring.setTotalUsedMemory(value);
				  		break;
				  	case "Total Memroy Left":
				  		vCenterMonitoring.setTotalMemoryLeft(value);
				  		break;
				  	case "Total VMs":
				  		vCenterMonitoring.setTotalVMs(Integer.valueOf(value));
				  		break;
				  	case "Total ON VMs":
				  		vCenterMonitoring.setTotalOnVMs(Integer.valueOf(value));
				  		break;
				  	case "Total Datastore":
				  		vCenterMonitoring.setTotalDatastore(value);
				  		break;
				  	case "Total Used Datastore":
				  		vCenterMonitoring.setTotalUsedDatastore(value);
				  		break;
				  	case "Total Free Datastore":
				  		vCenterMonitoring.setTotalFreeDatastore(value);
				  		break;
            	 }
             }
        }catch(IOException e){
        	logger.fatal("Failed to read the vcenter report file. Exception - "+e.getMessage());
	    	return null;
	    }
	    logger.debug("Parsed vCenter Monitoring Data Output...");
	    return vCenterMonitoring;
	}
	
}
