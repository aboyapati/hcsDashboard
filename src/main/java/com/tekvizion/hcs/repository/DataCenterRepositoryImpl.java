package com.tekvizion.hcs.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.DataCenter;

@Repository
public class DataCenterRepositoryImpl implements DataCenterRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(DataCenter dataCenter) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(dataCenter);
		session.flush();
		session.close();
	}

	@Override
	public void edit(DataCenter dataCenter) {
		Session session = this.sessionFactory.openSession();
		session.merge(dataCenter);
		session.flush();
		session.close();

	}

	@Override
	public void delete(String id) {
		Session session = this.sessionFactory.openSession();
		DataCenter dataCenter = (DataCenter) session.get(DataCenter.class, id);
		session.delete(dataCenter);
		session.flush();
		session.close();
	}

	@Override
	public DataCenter findById(String id) {
		Session session = this.sessionFactory.openSession();
		DataCenter dataCenter = (DataCenter) session.get(DataCenter.class, id);
		session.close();
		return dataCenter;
	}

	@SuppressWarnings("unchecked")
	@Override
	public DataCenter findByName(String name) {
		StringBuilder query = new StringBuilder("from DataCenter where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<DataCenter> dataCenterList =  q.list();
		session.close();
		if(dataCenterList.isEmpty()) {
			return null;
		}
		return dataCenterList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DataCenter> getAll() {
		StringBuilder query = new StringBuilder("from DataCenter");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<DataCenter> dataCenterList =  q.list();
		session.close();
		return dataCenterList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DataCenter> listDataCentersByCustomer(String customerId){
		StringBuilder query = new StringBuilder("from DataCenter where customer_id =:customerId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("customerId", customerId);
		List<DataCenter> dataCenterList =  q.list();
		session.close();

		return dataCenterList;
	}
}
