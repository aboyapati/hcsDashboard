
package com.tekvizion.hcs.webservice;

import java.util.List;

import com.tekvizion.hcs.dto.UserTypesDto;
import com.tekvizion.hcs.dto.UsersDto;

/**
 * @author btadiboyina
 *
 */
public interface SSOAPIHandler {
	
	
	/**
	 * Method to count the user by given login name
	 * @param loginName
	 * @return
	 */
	
	public boolean isUserExist(String loginName);
	
	/**
	 * Method to find the user by login id
	 * @param loginName
	 * @return
	 */
	public UsersDto getUserByLogin(String loginName);
	
	/**
	 * Method to list all user roles
	 * @return
	 */
	public List<UserTypesDto> listAllUserRoles();
	
	/**
	 * Method to add the user
	 * @return
	 */
	public UsersDto addUser(UsersDto usersDto);
	
	/**
	 * Method to update the user
	 * @return
	 */
	public UsersDto updateUser(UsersDto usersDto); 
	
	/**
	 * Method to delete the user
	 * @return
	 */
	public boolean deleteUser(String  id);

}
