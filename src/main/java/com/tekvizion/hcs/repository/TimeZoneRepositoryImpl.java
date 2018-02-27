package com.tekvizion.hcs.repository;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tekvizion.hcs.modal.TimeZones;

/**
 * @author btadiboyina
 *
 */

@Repository
public class TimeZoneRepositoryImpl implements TimeZoneRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addTimeZone(TimeZones timeZone) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(timeZone);
		session.flush();
		session.close();
		
	}

	@Override
	public void editTimeZone(TimeZones timeZone) {
		Session session = this.sessionFactory.openSession();
		session.merge(timeZone);
		session.flush();
		session.close();
		
	}

	@Override
	public void deleteTimeZone(String id) {
		Session session = this.sessionFactory.openSession();
		TimeZones timeZone = (TimeZones) session.get(TimeZones.class, id);
		session.delete(timeZone);
		session.flush();
		session.close();
		
	}

	@Override
	public TimeZones findById(String id) {
		Session session = this.sessionFactory.openSession();
		TimeZones timeZone = (TimeZones) session.get(TimeZones.class, id);
		session.close();
		return timeZone;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeZones> listAllTimeZones() {
		StringBuilder query = new StringBuilder("from TimeZones order by name asc");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<TimeZones> timeZonesList =  q.list();
		session.close();
		return timeZonesList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public TimeZones findByName(String name) {
		StringBuilder query = new StringBuilder("from TimeZones where name =:name");

		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<TimeZones> timeZonesList =  q.list();
		session.close();
		if(timeZonesList.isEmpty()) {
			return null;
		}
		return timeZonesList.get(0);
	}

}
