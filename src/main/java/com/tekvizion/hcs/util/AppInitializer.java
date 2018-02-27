package com.tekvizion.hcs.util;


import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.tekvizion.hcs.modal.CarriersType;
import com.tekvizion.hcs.modal.MonitoringExecutionStatus;
import com.tekvizion.hcs.service.CarriersTypeService;
import com.tekvizion.hcs.service.MonitoringExecutionStatusService;
import com.tekvizion.hcs.modal.TimeZones;
import com.tekvizion.hcs.modal.UserType;
import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.service.TimeZoneService;
import com.tekvizion.hcs.service.UserTypeService;
import com.tekvizion.hcs.service.UsersService;



/**
 * Here we define the code that is invoked by the framework while loading the application.
 * This initializes the portal with the basic data (in case of new installation). 
 * This class will also be used to upgrade the system version. 
 * @author lsong
 *
 */
public class AppInitializer {
	
	static Logger logger = Logger.getLogger("A1");

	@Autowired
	private UserTypeService userTypeService;
	
	@Autowired
	private UsersService userService;
	
	@Autowired
	private TimeZoneService timeZoneService;
	
	@Autowired
	private CarriersTypeService carriersTypeService;
	
	@Autowired
	private MonitoringExecutionStatusService monitoringExecutionStatusService;
	
	@Value("${app.settings.vcenter.waiting.time:180000}")
	public int vcenterWaitingTime;
	
 	@Value("${app.settings.from.address:onpoint.notifications@tekvizion.com}")
 	private String email_from_address;
	
	public static int VCENTER_WAITING_TIME;
	
 	public static String EMAIL_FROM_ADDRESS;
	
	@PostConstruct
	public void initApp(){
			
		//adding user types
		if(this.userTypeService.listAll().size() ==0){
			UserType type = new UserType();		
			type = new UserType();
			type.setDescription("Admin");
			type.setName(UserTypeConstant.role_admin);
			this.userTypeService.add(type);
			
			type = new UserType();
			type.setName(UserTypeConstant.role_customer_admin);
			type.setDescription("Customer Admin");
			this.userTypeService.add(type);
			logger.info("ROLE : "+UserTypeConstant.role_customer_admin+" added");
			
			type = new UserType();
			type.setName(UserTypeConstant.role_customer_user);
			type.setDescription("Customer User");
			this.userTypeService.add(type);
			logger.info("ROLE : "+UserTypeConstant.role_customer_user+" added");
		}
		
		//adding default user
		if(this.userService.getAll().size()==0){
			
			UserType userType = this.userTypeService.findByName(UserTypeConstant.role_admin);
			
			Users user = new Users();	
			user.setLoginId("tekvizionadmin");
			user.setName("tekvizion");
			user.setPassword("tekV1z10n");			
			user.setUsertype(userType);
			
			this.userService.addUser(user);
		}
		
		TimeZones timeZone=this.timeZoneService.findByName("GMT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("GMT");
			timeZone.setDescription("Greenwich Mean Time");
			timeZone.setRelativeGmt("GMT");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}

		timeZone=this.timeZoneService.findByName("UTC");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("UTC");
			timeZone.setDescription("Universal Coordinated Time");
			timeZone.setRelativeGmt("GMT");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("ECT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("ECT");
			timeZone.setDescription("European Central Time");
			timeZone.setRelativeGmt("GMT+1:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("EET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("EET");
			timeZone.setDescription("Eastern European Time");
			timeZone.setRelativeGmt("GMT+2:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}

		timeZone=this.timeZoneService.findByName("ART");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("ART");
			timeZone.setDescription("(Arabic) Egypt Standard Time");
			timeZone.setRelativeGmt("GMT+2:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("EAT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("EAT");
			timeZone.setDescription("Eastern African Time");
			timeZone.setRelativeGmt("GMT+3:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("MET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("MET");
			timeZone.setDescription("Middle East Time");
			timeZone.setRelativeGmt("GMT+3:30");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("NET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("NET");
			timeZone.setDescription("Near East Time");
			timeZone.setRelativeGmt("GMT+4:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("PLT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("PLT");
			timeZone.setDescription("Pakistan Lahore Time");
			timeZone.setRelativeGmt("GMT+5:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("IST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("IST");
			timeZone.setDescription("Indian Standard Time");
			timeZone.setRelativeGmt("GMT+5:30");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("BST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("BST");
			timeZone.setDescription("Bangladesh Standard Time");
			timeZone.setRelativeGmt("GMT+6:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("VST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("VST");
			timeZone.setDescription("Vietnam Standard Time");
			timeZone.setRelativeGmt("GMT+7:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("CTT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("CTT");
			timeZone.setDescription("China Taiwan Time");
			timeZone.setRelativeGmt("GMT+8:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("JST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("JST");
			timeZone.setDescription("Japan Standard Time");
			timeZone.setRelativeGmt("GMT+9:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("ACT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("ACT");
			timeZone.setDescription("Australia Central Time");
			timeZone.setRelativeGmt("GMT+9:30");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("AET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("AET");
			timeZone.setDescription("Australia Eastern Time");
			timeZone.setRelativeGmt("GMT+10:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("SST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("SST");
			timeZone.setDescription("Solomon Standard Time");
			timeZone.setRelativeGmt("GMT+11:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("NST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("NST");
			timeZone.setDescription("New Zealand Standard Time");
			timeZone.setRelativeGmt("GMT+12:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("MIT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("MIT");
			timeZone.setDescription("Midway Islands Time");
			timeZone.setRelativeGmt("GMT-11:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("HST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("HST");
			timeZone.setDescription("Hawaii Standard Time");
			timeZone.setRelativeGmt("GMT-10:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("AST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("AST");
			timeZone.setDescription("Alaska Standard Time");
			timeZone.setRelativeGmt("GMT-9:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("PST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("PST");
			timeZone.setDescription("Pacific Standard Time");
			timeZone.setRelativeGmt("GMT-8:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("PNT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("PNT");
			timeZone.setDescription("Phoenix Standard Time");
			timeZone.setRelativeGmt("GMT-7:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("MST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("MST");
			timeZone.setDescription("Mountain Standard Time");
			timeZone.setRelativeGmt("GMT-7:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("CST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("CST");
			timeZone.setDescription("Central Standard Time");
			timeZone.setRelativeGmt("GMT-6:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("EST");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("EST");
			timeZone.setDescription("Eastern Standard Time");
			timeZone.setRelativeGmt("GMT-5:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("IET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("IET");
			timeZone.setDescription("Indiana Eastern Standard Time");
			timeZone.setRelativeGmt("GMT-5:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("PRT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("PRT");
			timeZone.setDescription("Puerto Rico and US Virgin Islands Time");
			timeZone.setRelativeGmt("GMT-4:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("CNT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("CNT");
			timeZone.setDescription("Canada Newfoundland Time");
			timeZone.setRelativeGmt("GMT-3:30");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("AGT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("AGT");
			timeZone.setDescription("Argentina Standard Time");
			timeZone.setRelativeGmt("GMT-3:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("BET");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("BET");
			timeZone.setDescription("Brazil Eastern Time");
			timeZone.setRelativeGmt("GMT-3:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		timeZone=this.timeZoneService.findByName("CAT");
		if(timeZone==null){
			timeZone=new TimeZones();
			timeZone.setName("CAT");
			timeZone.setDescription("Central African Time");
			timeZone.setRelativeGmt("GMT-1:00");
			this.timeZoneService.addTimeZone(timeZone);
			logger.info("Added Time Zone value in Database");
		}
		
		if(this.carriersTypeService.getAll().size() == 0){
			CarriersType carriersType1 = new CarriersType();
			carriersType1.setName("ATT");
			carriersType1.setDomain("txt.att.net");
			this.carriersTypeService.add(carriersType1);

			CarriersType carriersType2 = new CarriersType();
			carriersType2.setName("Sprint");
			carriersType2.setDomain("messaging.sprintpcs.com");
			this.carriersTypeService.add(carriersType2);

			CarriersType carriersType3 = new CarriersType();
			carriersType3.setName("T-mobile");
			carriersType3.setDomain("tmomail.net");
			this.carriersTypeService.add(carriersType3);

			CarriersType carriersType4 = new CarriersType();
			carriersType4.setName("Verizon");
			carriersType4.setDomain("vtext.com");
			this.carriersTypeService.add(carriersType4);
		}
		//trim the string if it is not null. This is done to prevent any parsing errors later     			
		VCENTER_WAITING_TIME = vcenterWaitingTime;
		logger.info("*** VCENTER_WAITING_TIME is : "+ VCENTER_WAITING_TIME);
		
		EMAIL_FROM_ADDRESS=email_from_address;
		logger.info("*** VCENTER_WAITING_TIME is : "+ VCENTER_WAITING_TIME);
		
		MonitoringExecutionStatus monitoringExecutionStatus=this.monitoringExecutionStatusService.getMonitoringExecutionStatus();
		if(monitoringExecutionStatus==null){
			monitoringExecutionStatus=new MonitoringExecutionStatus();
			monitoringExecutionStatus.setExecutionStatus(false);
			this.monitoringExecutionStatusService.addMonitoringExecutionStatus(monitoringExecutionStatus);
			logger.info("Added Time Zone value in Database");
		}
	}
}
