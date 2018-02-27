package com.tekvizion.hcs.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.util.ComponentTypesEnum;

@Repository
public class ComponentTypesRepositoryImpl implements ComponentTypesRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(ComponentTypes componentTypes) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(componentTypes);
		session.flush();
		session.close();
	}

	@Override
	public void edit(ComponentTypes componentTypes) {
		Session session = this.sessionFactory.openSession();
		session.merge(componentTypes);
		session.flush();
		session.close();

	}

	@Override
	public void delete(String id) {
		Session session = this.sessionFactory.openSession();
		ComponentTypes componentTypes = (ComponentTypes) session.get(ComponentTypes.class, id);
		session.delete(componentTypes);
		session.flush();
		session.close();
	}

	@Override
	public ComponentTypes findById(String id) {
		Session session = this.sessionFactory.openSession();
		ComponentTypes componentTypes = (ComponentTypes) session.get(ComponentTypes.class, id);
		session.close();
		return componentTypes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ComponentTypes findByName(String name) {
		StringBuilder query = new StringBuilder("from ComponentTypes where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<ComponentTypes> componentTypesList =  q.list();
		session.close();
		if(componentTypesList.isEmpty()) {
			return null;
		}
		return componentTypesList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ComponentTypes> getAll() {
		StringBuilder query = new StringBuilder("from ComponentTypes");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<ComponentTypes> componentTypesList =  q.list();
		session.close();
		if(componentTypesList.isEmpty()) {
			return null;
		}
		return componentTypesList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ComponentTypes> findByDataCenterId(String dataCenterId){
		StringBuilder query = new StringBuilder("from ComponentTypes where dataCenter.id =:dataCenterId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("dataCenterId", dataCenterId);
		List<ComponentTypes> componentTypeList =  q.list();
		session.close();
		return componentTypeList;
	}

	@Override
	public List<ComponentTypes> findByType(ComponentTypesEnum type,String dataCenterId) {
		StringBuilder query = new StringBuilder("from ComponentTypes where type =:type and dataCenter.id =:dataCenterId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("type", type);
		q.setParameter("dataCenterId", dataCenterId);
		List<ComponentTypes> componentTypesList =  q.list();
		session.close();		 
		return componentTypesList;
	}
	@Override
	public void deleteByDataCenterId(String dataCenterId){
		StringBuilder query = new StringBuilder("delete from ComponentTypes where dataCenter.id =:dataCenterId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("dataCenterId", dataCenterId);
		int del = q.executeUpdate();		
		session.close();
	}
}
