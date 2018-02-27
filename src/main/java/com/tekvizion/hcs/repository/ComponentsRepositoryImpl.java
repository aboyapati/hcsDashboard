package com.tekvizion.hcs.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.util.ComponentTypesEnum;

@Repository
public class ComponentsRepositoryImpl implements ComponentsRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(Components component) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(component);
		session.flush();
		session.close();
	}

	@Override
	public void edit(Components component) {
		Session session = this.sessionFactory.openSession();
		session.merge(component);
		session.flush();
		session.close();

	}

	@Override
	public void delete(String id) {
		Session session = this.sessionFactory.openSession();
		Components component = (Components) session.get(Components.class, id);
		session.delete(component);
		session.flush();
		session.close();
	}

	@Override
	public Components findById(String id) {
		Session session = this.sessionFactory.openSession();
		Components component = (Components) session.get(Components.class, id);
		session.close();
		return component;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Components findByName(String name) {
		StringBuilder query = new StringBuilder("from Components where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<Components> componentList =  q.list();
		session.close();
		if(componentList.isEmpty()) {
			return null;
		}
		return componentList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Components> getAll() {
		StringBuilder query = new StringBuilder("from Components");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<Components> componentList =  q.list();
		session.close();
		return componentList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Components> findByDataCenterId(String dataCenterId){
		StringBuilder query = new StringBuilder("from Components where dataCenter.id =:dataCenterId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("dataCenterId", dataCenterId);
		List<Components> componentList =  q.list();
		session.close();
		return componentList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Components findByComponentTypeId(String componentTypeId) {
		StringBuilder query = new StringBuilder("from Components where componentType.id =:componentTypeId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentTypeId", componentTypeId);
		List<Components> ComponentsList = (List<Components>) q.list();
		session.close();
		if(ComponentsList.size()>0){
			return (Components) ComponentsList.get(0);
		}
		return null;
		/*Components component = (Components) session.get(Components.class, componentTypeId);
		session.close();
		return component;*/
	}

	@SuppressWarnings("unchecked")
	@Override
	public Long findByNameAndIPAddress(String name, String ipAddress,String dataCenterId) {
		StringBuilder query = new StringBuilder("select count(*) from Components where name =:name and ipAddress =:ipAddress and dataCenter.id =:dataCenterId ");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		q.setParameter("ipAddress", ipAddress);
		q.setParameter("dataCenterId", dataCenterId);
		List<Long> componentList =  q.list();
		session.close();
		return componentList.get(0);
	}
	
	@Override
	public void deleteByDataCenterId(String dataCenterId){
		StringBuilder query = new StringBuilder("delete from Components where dataCenter.id =:dataCenterId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("dataCenterId", dataCenterId);
		int deleted = q.executeUpdate();		
		session.close();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Components> findByComponentType(ComponentTypesEnum type){
		StringBuilder query = new StringBuilder("from Components where componentType.type =:type");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("type", type);
		List<Components> componentsList = q.list();
		session.close();
		return componentsList;
	}

}
