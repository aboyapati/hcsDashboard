package com.tekvizion.hcs.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.EmailTracker;

@Repository
public class EmailTrackerRepositoryImpl implements EmailTrackerRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addEmailDetails(EmailTracker emailDetails) {
		Session session = this.sessionFactory.openSession();
		session.persist(emailDetails);
		session.flush();
		session.close();
	}

	@Override
	public void editEmailDetails(EmailTracker emailDetails) {
		Session session = this.sessionFactory.openSession();
		session.merge(emailDetails);
		session.flush();
		session.close();
	}

	@Override
	public void deleteEmailDetails(String id) {
		Session session = this.sessionFactory.openSession();
		EmailTracker emailDetails=(EmailTracker) session.get(EmailTracker.class, id);
		session.persist(emailDetails);
		session.flush();
		session.close();

	}

	@Override
	public EmailTracker findById(String id) {
		Session session = this.sessionFactory.openSession();
		EmailTracker emailTracker=(EmailTracker) session.get(EmailTracker.class, id);
		session.close();
		return emailTracker;
	}

	@Override
	public void cleanEmailTrackerDB() {
		// TODO Auto-generated method stub

	}

}
