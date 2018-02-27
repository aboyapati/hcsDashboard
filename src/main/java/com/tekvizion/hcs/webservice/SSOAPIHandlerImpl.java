package com.tekvizion.hcs.webservice;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

import com.tekvizion.hcs.dto.UserTypesDto;
import com.tekvizion.hcs.dto.UsersDto;
import com.tekvizion.hcs.modal.UserType;
import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.service.CarriersTypeService;
import com.tekvizion.hcs.service.UserTypeService;
import com.tekvizion.hcs.service.UsersService;

/**
 * @author btadiboyina
 *
 */

@Component
@Path("ssoAPI")
public class SSOAPIHandlerImpl implements SSOAPIHandler {
	
	private static Logger log = Logger.getLogger("rootLogger");
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private  UserTypeService userTypeService;
	
	@Autowired
	private CarriersTypeService carriersTypeService;
	
	@POST
	@Path("/isUserExist")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public boolean isUserExist(@RequestBody String login) {
		log.info(" - check the Login Id is already exist or not. login Id - "+login);
		return usersService.isUseridAvailable(login);
	}

	@POST
	@Path("/getUserByLogin")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public UsersDto getUserByLogin(@RequestBody String login) {
		
		Users users=usersService.getUserByLogin(login);

		if(users==null){
			log.fatal("Failed to get the login User details Reason: user object is null");	
			return null;
		}
		UsersDto usersDto=new UsersDto();
		usersDto.setLoginId(users.getLoginId());
		usersDto.setName(users.getName());
		usersDto.setPassword(users.getPassword());
		usersDto.setUserTypeName(users.getUsertype().getName());
		log.info("User Name |"+users.getName()+" successfully Featched the login user details.");
		return usersDto;
	}
	
	@POST
	@Path("/listAllUserRoles")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public List<UserTypesDto> listAllUserRoles() {
		List<UserType> userTypeList=userTypeService.listAll();
		List<UserTypesDto> userTypesDtoList=new ArrayList<UserTypesDto>();
		
		for(UserType userType:userTypeList){
			UserTypesDto userTypesDto=new UserTypesDto();
			userTypesDto.setName(userType.getName());
			userTypesDto.setDescription(userType.getDescription());
			userTypesDtoList.add(userTypesDto);
		}
		log.info("Featched the user type list : "+userTypesDtoList.size());
		return userTypesDtoList;
	}
	
	@POST
	@Path("/addUser")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public UsersDto addUser(@RequestBody UsersDto usersDto) {
		
	Users user=new Users();
	if(usersDto==null){
		log.fatal("Failed to add the User details Reason: usersDto object is null");
		return null;
	}
	user.setLoginId(usersDto.getLoginId());
	user.setUsertype(this.userTypeService.findByName(usersDto.getUserTypeName()));
	user.setName(usersDto.getName());
	user.setPassword(usersDto.getPassword());
	user.setTextAlert(usersDto.isTextAlert());
	user.setMobileNumber(usersDto.getMobileNumber());
	user.setEmail(usersDto.getEmail());
	user.setEmailnotification(usersDto.isEmailnotification());
	user.setCarriersType(this.carriersTypeService.findByName(usersDto.getCarrierTypeName()));
	this.usersService.addUser(user);
	usersDto.setId(user.getId());
	log.info("User Name |"+user.getName()+" successfully added new user.");
	return usersDto;
	}
	
	@POST
	@Path("/updateUser")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public UsersDto updateUser(@RequestBody UsersDto usersDto) {
	
		log.debug("Update User Method Invoked");
		if(usersDto==null){
			log.fatal("Failed to update the User details Reason: usersDto object is null");
			return null;
		}
		Users user = this.usersService.getUserByLogin(usersDto.getLoginId());
		if(user==null){
			log.fatal("Failed to update the User details Reason: user object is null");
			return null;
		}
		user.setLoginId(usersDto.getLoginId());
		user.setUsertype(this.userTypeService.findByName(usersDto.getUserTypeName())==null?null:this.userTypeService.findByName(usersDto.getUserTypeName()));
		user.setName(usersDto.getName());
		user.setPassword(usersDto.getPassword());
		user.setTextAlert(usersDto.isTextAlert());
		user.setMobileNumber(usersDto.getMobileNumber());
		user.setEmail(usersDto.getEmail());
		user.setEmailnotification(usersDto.isEmailnotification());
		user.setCarriersType(this.carriersTypeService.findByName(usersDto.getCarrierTypeName()));
		this.usersService.editUser(user);
		log.info("User Name |"+user.getName()+" & loginId - "+user.getLoginId()+" is updated");
		return usersDto;
	}
	
	@POST
	@Path("/deleteUser")
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public boolean deleteUser(@RequestBody String  loginId) {
		
		log.debug("Delete User Method Invoked for user with login id "+loginId);
		if(loginId==null || loginId.isEmpty()){
			log.fatal("Failed to delete the User Reason: userid is null or empty");
			return false;
		}
		Users user = this.usersService.getUserByLogin(loginId);
		if(user==null){
			log.fatal("Failed to delete the User Reason: userid is null or empty");
			return false;
		}
		log.debug("ID : "+user.getId());
		this.usersService.deleteUser(user.getId());
		log.info("User deleted successfully with Login Id - "+loginId);
		return true;
	}
}
