package com.tekvizion.hcs.util;

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
import org.springframework.stereotype.Component;

import com.jcraft.jsch.SshCmd;
import com.tekvizion.hcs.asa.ResponseData;
import com.tekvizion.hcs.asa.SendExecCommand;
import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.modal.MonitoringExecutionStatus;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.service.ComponentsService;
import com.tekvizion.hcs.service.MonitoringExecutionStatusService;
import com.tekvizion.hcs.service.MonitoringService;

@Component
public class DataMonitoringCronUtil {
	
	private static Logger logger = Logger.getLogger("rootLogger");
	public static final String Nexus = "NEXUS";
	public static final String Asa = "ASA";
	public static final String VCenter = "VCENTER";
	
	@Autowired
	private MonitoringService monitoringService;
	
	@Autowired
	private ComponentsService componentsService;
	
	@Autowired
	private MonitoringExecutionStatusService monitoringExecutionStatusService;
	
	/**
	 * This method retrieves the data from VM's and inserts into database for every 24 hours.
	 */
	public boolean retrieveAndUpdateMonitoredData(String monitoringFromCronOrOnDemand){
		List<Components> componentsList = componentsService.getAll();		
		if(componentsList.isEmpty()){
			logger.debug("Components are not available...");
			return false;
		}
		boolean executionStatus = monitoringExecutionStatusService.isMonitoringCommandsExecuting();
		logger.debug("Monitoring status of last/ongoing execution : " + executionStatus);

		if(!executionStatus){
			MonitoringExecutionStatus monitoringExecutionStatus = monitoringExecutionStatusService.getMonitoringExecutionStatus();
			monitoringExecutionStatus.setLastExecutionFrom(monitoringFromCronOrOnDemand);
			logger.debug("setting the monitoring execution status to true before execution of VM commands...");
			monitoringExecutionStatus.setExecutionStatus(true);
			monitoringExecutionStatusService.editMonitoringExecutionStatus(monitoringExecutionStatus);
			for(Components component :  componentsList){
				String type = component.getComponentType().getType().name();
				logger.debug("Component Type : " + type);
				boolean green = false;
				boolean orange = false;
				boolean red = false;
				long warnStart = 0;
				long warnEnd = 0;
				switch(type){
		    	case Nexus:
		    		logger.debug("Trying to get monitoring data for Nexus Component. id : " + component.getId());
		    		NexusMonitoring nexusMonitoring = this.addNexusMonitoringData(component);				
		    		if(nexusMonitoring == null){
			    		logger.debug("No monitoring data available for Nexus Component. id : " + component.getId());
						break;
					}
					
		    		ComponentTypes componentType = component.getComponentType();				
					if(nexusMonitoring.getTotalBgpPeers() < Integer.parseInt(componentType.getBgpPeersWarnStart())){
						green = true;
					}else if(nexusMonitoring.getTotalBgpPeers() > Integer.parseInt(componentType.getBgpPeersWarnEnd())){
						red = true;
					}else{
						orange = true;
					}
					if(nexusMonitoring.getVrfCount() < Integer.parseInt(componentType.getVrfWarnStart())){
						green = true;
					}else if(nexusMonitoring.getVrfCount() > Integer.parseInt(componentType.getVrfWarnEnd())){
						red = true;
					}else{
						orange = true;
					}
					if(nexusMonitoring.getExistingVlans()< Integer.parseInt(componentType.getVlanWarnStart())){
						green = true;
					}else if(nexusMonitoring.getExistingVlans() > Integer.parseInt(componentType.getVlanWarnEnd())){
						red = true;
					}else{
						orange = true;
					}
					if(nexusMonitoring.getTotalHsrpEnabledInterfaces() < Integer.parseInt(componentType.getHsrpWarnStart())){
						green = true;
					}else if(nexusMonitoring.getTotalHsrpEnabledInterfaces() > Integer.parseInt(componentType.getHsrpWarnEnd())){
						red = true;
					}else{
						orange = true;
					}
					if(nexusMonitoring.getStaticRoutesCount() < Integer.parseInt(componentType.getStaticRoutesWarnStart())){
						green = true;
					}else if(nexusMonitoring.getStaticRoutesCount() > Integer.parseInt(componentType.getStaticRoutesWarnEnd())){
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
					logger.debug("Added monitoring data status for Nexus Component. id : " + component.getId());
		    		break;
		    	
		    	case Asa:
		    		logger.debug("Trying to get monitoring data for ASA Component. id : " + component.getId());
		    		AsaMonitoring asaMonitoring = this.addASAMonitoringData(component);
					if(asaMonitoring == null){
			    		logger.debug("No monitoring data available for ASA Component. id : " + component.getId());
						break;
					}
					warnStart = (asaMonitoring.getTotalActiveSecurityContexts()*70)/100;
					warnEnd = (asaMonitoring.getTotalActiveSecurityContexts()*90)/100;
					if(asaMonitoring.getTotalSecurityContexts() < warnStart){
						green = true;
					}else if(asaMonitoring.getTotalSecurityContexts() > warnEnd){
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
					logger.debug("Added monitoring data status for ASA Component. id : " + component.getId());
		    		break;
		    		
		    	case VCenter:
		    		logger.debug("Trying to execute monitoring commands for vCenter Component. id : " + component.getId());
		    		this.executeVCenterMonitoringCommand(component, monitoringFromCronOrOnDemand);				
					logger.debug("executing of monitoring commands for vCenter Component is completed. id : " + component.getId());
		    		break;
				}
					
			}
			logger.debug("setting the monitoring execution status to false after execution of VM commands...");
			monitoringExecutionStatus.setExecutionStatus(false);
			monitoringExecutionStatusService.editMonitoringExecutionStatus(monitoringExecutionStatus);
		}
		return executionStatus;
	}
	
	private NexusMonitoring addNexusMonitoringData(Components component){
		logger.debug("Trying to add monitoring data by executing command for Nexus Component. id : " + component.getId());
	
		String cmd = ""; 
		 cmd +=	"echo VRF_START/ ; show vrf | count ; echo /VRF_END| ; ";
		 cmd += "echo BGP_START/ ; show bgp vrf all sessions |  in \"Total peers\" ; echo /BGP_END| ; "; 
		 cmd += "echo VLAN_START/ ; show vlan summary | in \"Number of existing\" ; echo /VLAN_END| ; "; 
		 cmd += "echo HSRP_START/ ; show hsrp ; echo /HSRP_END| ; "; 
		 cmd += "echo IP_ROUTE_START/ ; show run | in \"ip route\" | count  ; echo /IP_ROUTE_END ; "; 
		// cmd += "echo __VRRP_START__ ; show vrrp ; echo __VRRP_END__ ; "; 
		
		logger.debug("Command to execute Nexus - "+cmd);
		Date start = new Date();
		int sessionTo = 20;
		int commandTo = 20;
		
		String commandResult  = getCommandResults(component.getUserName(), component.getPassword(), component.getIpAddress(), cmd, commandTo, sessionTo);
	
		Date end = new Date();
		long diff = end.getTime() - start.getTime();
		logger.debug("============== Done. Time to Run (ms): " + diff +" =================");
		
		NexusMonitoring nexusMonitoring;
		
		if(commandResult == null || commandResult.isEmpty()){
			logger.debug("Result for Nexus Component is null or empty. id : " + component.getId());
			nexusMonitoring = new NexusMonitoring();
			nexusMonitoring.setVrfCount(0);
			nexusMonitoring.setTotalBgpPeers(0);
			nexusMonitoring.setEstablishedBgpPeers(0);
			nexusMonitoring.setExistingVlans(0);
			nexusMonitoring.setExistingUserVlans(0);
			nexusMonitoring.setExistingExtendedVlans(0);
			nexusMonitoring.setTotalHsrpEnabledInterfaces(0);
			nexusMonitoring.setStaticRoutesCount(0);	
			nexusMonitoring.setMonitoringTimestamp(new Date());
			nexusMonitoring.setComponent(component);
			nexusMonitoring.setComponentReachable(false);
			monitoringService.addNexusMonitoring(nexusMonitoring);
			return nexusMonitoring;
		}
	 	
		nexusMonitoring = parseCommandResults(commandResult);
		nexusMonitoring.setComponentReachable(true);
		nexusMonitoring.setMonitoringTimestamp(new Date());
		nexusMonitoring.setComponent(component);
	
		monitoringService.addNexusMonitoring(nexusMonitoring);
		logger.debug("Added monitoring data for Nexus Component. id : " + component.getId());
		return nexusMonitoring;
	
	}	
		
	private static String getCommandResults(String u, String p, String ip, String c, int cto, int sto) {
		SshCmd ssh = new SshCmd(u, p, ip, c, cto, sto);
		ssh.getShhCommand();
		if(ssh.getError()){
			logger.error("SSH Failure. " + ssh.getErrorString());
			return null;
		} else {
			int stat = ssh.getChannel().getExitStatus();
			logger.debug("SSH Success. Channel Exit Status: " + stat);
			logger.debug("Command Results:\n" + ssh.getCommandResult());
		}
		return ssh.getCommandResult();
	}
	
	private NexusMonitoring parseCommandResults(String result){
		logger.debug("Parsing Nexus Monitoring Data Output...");
		NexusMonitoring nexusMonitoring = new NexusMonitoring();
		String[] res = result.split("\\|");
		String[] splitStr;
		for (int i=0; i<5; i++) {
			switch(i) {
			case 0:
				splitStr = res[0].split("\\/");
				nexusMonitoring.setVrfCount(Integer.parseInt(splitStr[1].trim()));
				break;
			case 1:
				splitStr = res[1].split("\\/");
				nexusMonitoring.setTotalBgpPeers(Integer.parseInt(splitStr[1].split("\\,")[0].split("Total peers ")[1].trim()));
				nexusMonitoring.setEstablishedBgpPeers(Integer.parseInt(splitStr[1].split("\\,")[1].split(" established peers ")[1].trim()));
				
				break;
			case 2:
				splitStr = res[2].split("\\/");
				String[] split = splitStr[1].trim().split("\\\n");
				String regex = "[^\\d]+";
			    String[] str = split[0].split(regex);
				nexusMonitoring.setExistingVlans(Integer.parseInt(str[1].trim()));
				str = split[1].split(regex);
				nexusMonitoring.setExistingUserVlans(Integer.parseInt(str[1].trim()));
				str = split[2].split(regex);
				nexusMonitoring.setExistingExtendedVlans(Integer.parseInt(str[1].trim()));
			
				break;
			case 3:
				splitStr = res[3].split("\\/");
				if(splitStr[1] == null || splitStr[1].isEmpty() || splitStr[1].equals("\n"))
				break;
				
				nexusMonitoring.setTotalHsrpEnabledInterfaces(Integer.parseInt(splitStr[1].trim()));
				break;
			case 4:
				splitStr = res[4].split("\\/");
				if(splitStr[1] == null || splitStr[1].isEmpty() || splitStr[1].equals("\n"))
				break;
				
				nexusMonitoring.setStaticRoutesCount(Integer.parseInt(splitStr[1].trim()));				
				break;
			}
		}
		logger.debug("Successfully parsed Nexus Monitoring Data Output...");
		return nexusMonitoring;
	}
	
	private AsaMonitoring addASAMonitoringData(Components component){
		logger.debug("Trying to add monitoring data by executing command for ASA Component. id : " + component.getId());
		SendExecCommand exec = new SendExecCommand(component.getIpAddress(), component.getUserName(), component.getPassword());
		logger.debug("\nSending command show version | in Security");
		ResponseData data = exec.sendCommand("show version | in Security");	
		
		AsaMonitoring asaMonitoring = new AsaMonitoring();
		asaMonitoring.setComponentReachable(true);
		asaMonitoring.setComponent(component);
		
		if(data.getResult() == null || data.getResult().isEmpty()){
			logger.debug("Result for ASA Component command show version | in Security is null or empty. id : " + component.getId());
			asaMonitoring.setTotalFailOverSecurityContexts(0);
		    asaMonitoring.setTotalActiveSecurityContexts(0);
			asaMonitoring.setTotalSecurityContexts(0);
			asaMonitoring.setComponentReachable(false);
			asaMonitoring.setMonitoringTimestamp(new Date());
			monitoringService.addAsaMonitoring(asaMonitoring);
			return asaMonitoring;
		}
		logger.debug("ASA MonitoringData Output - "+data.getResult());
		
		logger.debug("\nSending command show context count");
		ResponseData dataContextCount = exec.sendCommand("show context count");
	
		
		if(dataContextCount.getResult() == null || dataContextCount.getResult().isEmpty()){
			logger.debug("Result for ASA Component command show context count is null or empty. id : " + component.getId());
			asaMonitoring.setTotalFailOverSecurityContexts(0);
		    asaMonitoring.setTotalActiveSecurityContexts(0);
			asaMonitoring.setTotalSecurityContexts(0);
	  		asaMonitoring.setComponentReachable(false);
			asaMonitoring.setMonitoringTimestamp(new Date());
	  		monitoringService.addAsaMonitoring(asaMonitoring);
			return asaMonitoring;
		}
		logger.debug("ASA MonitoringData context count Output - "+dataContextCount.getResult());
		
		int count=0;
		if(Integer.parseInt(data.getResponseCode())!=200){
			asaMonitoring.setTotalFailOverSecurityContexts(0);
		    asaMonitoring.setTotalActiveSecurityContexts(0);
			asaMonitoring.setTotalSecurityContexts(0);
	  		asaMonitoring.setComponentReachable(false);
			asaMonitoring.setMonitoringTimestamp(new Date());
		}
		else{
			logger.debug("Parsing ASA Security Contexts Monitoring Data Output...");
			String[] split = data.getResult().split("\\\n");
			for (String string : split) {
				if(string.contains("Security Contexts")){
					 String regex = "[^\\d]+";
				     String[] str = string.split(regex);
	
				     if(count==0){
				    	 asaMonitoring.setTotalActiveSecurityContexts(Integer.parseInt(str[1]));
				    	 count++;
				     }else{
				    	 asaMonitoring.setTotalFailOverSecurityContexts(Integer.parseInt(str[1]));
				     }
				}
			}
			logger.debug("Parsed ASA Security Contexts Monitoring Data Output...");
		}
		if(Integer.parseInt(dataContextCount.getResponseCode())!=200){
			asaMonitoring.setTotalFailOverSecurityContexts(0);
		    asaMonitoring.setTotalActiveSecurityContexts(0);
			asaMonitoring.setTotalSecurityContexts(0);
	  		asaMonitoring.setComponentReachable(false);
			asaMonitoring.setMonitoringTimestamp(new Date());
		}
		else{
			logger.debug("Parsing ASA Contexts Count Monitoring Data Output...");
			String splitContextCount = dataContextCount.getResult().split("\\:")[1].trim();
			asaMonitoring.setTotalSecurityContexts(Integer.parseInt(splitContextCount));
			logger.debug("Parsed ASA Contexts Count Monitoring Data Output...");
		}
		
		asaMonitoring.setMonitoringTimestamp(new Date());
		monitoringService.addAsaMonitoring(asaMonitoring);
		logger.debug("Added monitoring data for ASA Component. id : " + component.getId());
		return asaMonitoring;
	}
	
	private void executeVCenterMonitoringCommand(Components component, String monitoringFromCronOrOnDemand){
	
		String reportDirectoryPath = AppConstants.HCS_RPT_VCENTER + SystemUtils.FILE_SEPARATOR + component.getDataCenter().getId()+ SystemUtils.FILE_SEPARATOR + component.getId();
		File reportDirectory = new File(reportDirectoryPath);
		
		if(reportDirectory.exists()){
			logger.info("********* Report Directory already exists *********** ");
		}else{
			logger.info("********* Creating Report Directory for vCenter command execution *********** ");
	    	reportDirectory.mkdirs();
		}
		
		String reportFileName = reportDirectory + SystemUtils.FILE_SEPARATOR + "report.rpt";		
		File ofile = new File(reportFileName);
		if(ofile.exists()){
			ofile.delete();
		}
		try {
			ofile.createNewFile();
		} catch (IOException e) {
			logger.error("Failed to create vCenter new report file: " + reportFileName);
			logger.error(e);
		}
		
		//Command
		StringBuilder cmd = new StringBuilder();
		cmd.append(AppConstants.HCS_VCENTER_SCRIPTS).append(SystemUtils.FILE_SEPARATOR)
										.append(AppConstants.HCS_EXECUTE_SCRIPT)
										.append(AppConstants.HCS_EXECUTE_SERVER_COMMAND)
										.append(component.getIpAddress())
										.append(AppConstants.HCS_EXECUTE_USERNAME_COMMAND)
										.append(component.getUserName())
										.append(AppConstants.HCS_EXECUTE_PASSWORD_COMMAND)
										.append(component.getPassword())
										.append(AppConstants.HCS_EXECUTE_REPORT_COMMAND)
										.append(reportDirectoryPath).append(SystemUtils.FILE_SEPARATOR)
										.append(AppConstants.HCS_REPORT_FILE);
		
		
		
		try {
			logger.info(" - execution of vCenter process is started. Command - "+cmd.toString());
			ExecuteCommand command = new ExecuteCommand(cmd.toString(), logger, false);
			logger.info(" - vCenter process is running.");
			command.run();
			logger.info(" - execution of vCenter process is completed. Command - "+cmd.toString());
			if(MonitorStatusConstants.EXECUTION_ONDEMAND.equals(monitoringFromCronOrOnDemand)){
				logger.info(" - parsing of vCenter report file is started OnDemand... ");
				Thread.sleep(AppInitializer.VCENTER_WAITING_TIME);
				VCenterMonitoring vCenterMonitoring = parseVCenterMonitoringData(reportFileName);
				if(vCenterMonitoring==null) {
					 logger.debug("Monitoring data is not available for vCenter Component. id : " + component.getId());
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
      				 logger.debug("Added empty monitoring data for VCenter Component. id : " + component.getId());
				}		
			}else{
				logger.info(" - parsing of vCenter report file will start from Cron... ");
			}
			
		}catch(Exception e) {
			logger.fatal(" - Failed to check if the vCenter process is running. Execption - "+e.getMessage());			
		}		
	}
	
	
	/**
	 * Method to parse the report file of VCenterMonitoring and read the details
	 * @param vCenterMonitoring
	 * @return
	 */
	private VCenterMonitoring parseVCenterMonitoringData(String reportFileName){
		logger.debug("Parsing vCenter Monitoring Data Output OnDemand..."); 
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
	    logger.debug("Parsed vCenter Monitoring Data Output OnDemand...");
	    return vCenterMonitoring;
	}
}
