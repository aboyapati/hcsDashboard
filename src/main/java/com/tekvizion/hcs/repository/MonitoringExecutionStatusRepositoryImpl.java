package com.tekvizion.hcs.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.MonitoringExecutionStatus;

@Repository
public class MonitoringExecutionStatusRepositoryImpl implements MonitoringExecutionStatusRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(monitoringExecutionStatus);
		session.flush();
		session.close();
	}

	@Override
	public void editMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus) {
		Session session = this.sessionFactory.openSession();
		session.merge(monitoringExecutionStatus);
		session.flush();
		session.close();

	}

	@Override
	public void deleteMonitoringExecutionStatus(String id) {
		Session session = this.sessionFactory.openSession();
		MonitoringExecutionStatus cronOrOnDemandMonitoringExecutionStatus = (MonitoringExecutionStatus) session.get(MonitoringExecutionStatus.class, id);
		session.delete(cronOrOnDemandMonitoringExecutionStatus);
		session.flush();
		session.close();
	}

	@Override
	public boolean isMonitoringCommandsExecuting() {
		StringBuilder query = new StringBuilder("from MonitoringExecutionStatus");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<MonitoringExecutionStatus> monitoringExecutionStatusList =  q.list();
		session.close();
		if(monitoringExecutionStatusList.isEmpty()) {
			return false;
		}else{
			MonitoringExecutionStatus monitoringExecutionStatus = monitoringExecutionStatusList.get(0);
			if(monitoringExecutionStatus.isExecutionStatus()){
				return true;
			}
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public MonitoringExecutionStatus getMonitoringExecutionStatus() {
		StringBuilder query = new StringBuilder("from MonitoringExecutionStatus");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<MonitoringExecutionStatus> monitoringExecutionStatusList =  q.list();
		session.close();
		if(monitoringExecutionStatusList.isEmpty()) {
			return null;
		}
		return monitoringExecutionStatusList.get(0);
	}

}
