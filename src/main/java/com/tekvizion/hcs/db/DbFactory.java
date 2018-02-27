package com.tekvizion.hcs.db;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DbFactory {
	
	private SessionFactory sessionFactory = null;
	private static final Logger logger = LoggerFactory.getLogger("org.apache.log4j.xml");
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public SessionFactory getSessionFactory(){
		return this.sessionFactory;
	}
	
	public Session openSession() throws HibernateException {
		return this.sessionFactory.openSession();
	}
	
	public void closeFactory(){
		if(this.sessionFactory != null){
			try {
				this.sessionFactory.close();
			} catch(HibernateException ex){
				logger.error(ex.getMessage());
			}
		}
	}
	
	public void close(Session session){
		if(session != null){
			try {
				session.close();
			} catch (HibernateException ex){
				logger.error(ex.getMessage());
			}
		}
	}
	
	public void rollback(Transaction tx){
		try {
			if(tx != null){
				tx.rollback();
			}
		} catch (HibernateException ex){
			logger.error(ex.getMessage() );
		}
	}

}