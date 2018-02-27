package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.Users;
import com.tekvizion.hcs.repository.UsersRepository;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersRepository userRepo;
	
	@Override
	public List<Users> getAll() {
		return this.userRepo.getAll();
	}

	@Override
	public Users getUserByLogin(String login) {
		return this.userRepo.getUserByLogin(login);
	}

	@Override
	public Users getAuthenticatedUser() {
		return 	this.userRepo.getAuthenticatedUser();
	}

	@Override
	@Transactional
	public void addUser(Users user) {
		this.userRepo.addUser(user);
	}

	@Override
	@Transactional
	public void editUser(Users user) {
		this.userRepo.editUser(user);	
	}

	@Override
	public Users findById(String Id) {
		return this.userRepo.findById(Id);
	}

	@Override
	public String getAuthenticatedUserName() {
		return this.userRepo.getAuthenticatedUserName();
	}

	@Override
	public String getAuthenticatedUserRole() {
		return this.userRepo.getAuthenticatedUserRole();
	}

	@Override
	@Transactional
	public void deleteUser(String id) {
		this.userRepo.deleteUser(id);	
	}

	@Override
	public boolean isUseridAvailable(String loginId) {
		return this.userRepo.isUseridAvailable(loginId);
	}
	
}
