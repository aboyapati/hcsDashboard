package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.Users;


public interface UsersRepository {

	public Users findById(String Id);
	
	public List<Users> getAll();

	public Users getUserByLogin(String login);	

	public Users getAuthenticatedUser();
	
	public void addUser(Users user);
	
	public void editUser(Users user);
	
	public String getAuthenticatedUserName();
	
	public String getAuthenticatedUserRole();

	public void deleteUser(String id);
	
	/* Method to check if the user with given login id already exists
	 * @param loginId
	 * @return
	 */
	public boolean isUseridAvailable(String loginId);
	
}
