package com.tekvizion.hcs.repository;


import java.util.List;

import com.tekvizion.hcs.modal.UserType;

public interface UserTypeRepository {

	public void add(UserType userType);
	
	public void edit(UserType userType);
	
	public boolean delete(UserType userType);
	
	public List<UserType> listAll();

	public UserType findById(String id);
	
	public UserType findByName(String name);
}
