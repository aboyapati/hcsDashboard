package com.tekvizion.hcs.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.exception.MultipleUsersFoundException;
import com.tekvizion.hcs.exception.UserNotFoundException;
import com.tekvizion.hcs.modal.Users;
 

@Repository
public class UsersRepositoryImpl implements UsersRepository{

	@PersistenceContext
	EntityManager entityManager;
	
	static Logger logger = Logger.getLogger("dbLogs");
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Users> getAll() {
		Query q = this.entityManager.createQuery("from Users where del = false");	
		return (List<Users>) q.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Users getUserByLogin(String login) throws UserNotFoundException, MultipleUsersFoundException{
		Query q = this.entityManager.createQuery("from Users where loginId=:log and del = false");
		q.setParameter("log", login);
		List<Users> userList = q.getResultList();
		if(userList.size()==0){
			UserNotFoundException ex = new UserNotFoundException();
			ex.setErrMsg("User with id:"+ login+" not found");
			throw ex;
		}
		
		if(userList.size()>1){
			MultipleUsersFoundException ex = new MultipleUsersFoundException();
			ex.setErrMsg("Users with multiple loginID found ("+login+")");
			throw ex;
		}
		return userList.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Users getAuthenticatedUser() {
		Authentication authUser = SecurityContextHolder.getContext().getAuthentication();
		if(authUser==null){
			return null;
		}
		
		Query q = this.entityManager.createQuery("from Users where loginId=:log and del = false");
		q.setParameter("log", authUser.getName());
		List<Users> userList = q.getResultList();
		if(userList.size()!=1){			
			return null;
		}
		Users user = userList.get(0);
		return user;
	}
	
	@Override
	public void addUser(Users user) {
		try{
			this.entityManager.persist(user);
			this.entityManager.flush();
		}catch(Exception e){
			logger.fatal(e.getMessage());
		}
		
	}

	@Override
	public void editUser(Users user) {
		try{
			this.entityManager.merge(user);
			this.entityManager.flush();	
		}catch(Exception e){
			logger.fatal(e.getMessage());
		}
		
	}

	@Override
	public Users findById(String Id) {
		Users user = (Users) this.entityManager.find(Users.class, Id);
		return user;
	}

	@Override
	public String getAuthenticatedUserName() {
		Users users = this.getAuthenticatedUser();
		if(users==null){
			return "";
		}
		return users.getName();
	}

	@Override
	public String getAuthenticatedUserRole() {
		Users users = this.getAuthenticatedUser();
		if(users==null){
			return "";
		}
		return users.getUsertype().getName();
	}

	@Override
	public void deleteUser(String id) {
		Users user = (Users) this.entityManager.find(Users.class, id);
		this.entityManager.remove(user);
		this.entityManager.flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isUseridAvailable(String loginId) {
		Query q = this.entityManager.createQuery("select count(*) as total from Users where loginId=:log");
		q.setParameter("log", loginId);
		List<Long> cntList = q.getResultList();
		if(cntList.get(0) == 0)
			return false;
		return true;
	}

}
