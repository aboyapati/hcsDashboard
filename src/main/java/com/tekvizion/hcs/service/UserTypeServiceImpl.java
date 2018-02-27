package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.UserType;
import com.tekvizion.hcs.repository.UserTypeRepository;

@Service
public class UserTypeServiceImpl implements UserTypeService {

	@Autowired
	private UserTypeRepository repository; 
	
	@Override
	@Transactional
	public void add(UserType userType) {
		this.repository.add(userType);
	}

	@Override
	@Transactional
	public void edit(UserType userType) {
		this.repository.edit(userType);
	}

	@Override
	@Transactional
	public boolean delete(UserType userType) {		
		return this.repository.delete(userType);
	}
	
	@Override
	public List<UserType> listAll() {		
		return this.repository.listAll();
	}

	@Override
	public UserType findById(String id) {		
		return this.repository.findById(id);
	}

	@Override
	public UserType findByName(String name){
		return this.repository.findByName(name);
	}
}
