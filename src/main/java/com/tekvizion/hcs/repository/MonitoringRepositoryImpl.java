package com.tekvizion.hcs.repository;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.util.ComponentsHistoryConstants;

@Repository
public class MonitoringRepositoryImpl implements MonitoringRepository{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addNexusMonitoring(NexusMonitoring nexusMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(nexusMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public void editNexusMonitoring(NexusMonitoring nexusMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.merge(nexusMonitoring);
		session.flush();
		session.close();

	}

	@Override
	public void deleteNexusMonitoring(String id) {
		Session session = this.sessionFactory.openSession();
		NexusMonitoring nexusMonitoring = (NexusMonitoring) session.get(NexusMonitoring.class, id);
		session.delete(nexusMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public NexusMonitoring findByNexusMonitoringId(String id) {
		Session session = this.sessionFactory.openSession();
		NexusMonitoring nexusMonitoring = (NexusMonitoring) session.get(NexusMonitoring.class, id);
		session.close();
		return nexusMonitoring;
	}

	@SuppressWarnings("unchecked")
	@Override
	public NexusMonitoring findByNexusMonitoringName(String name) {
		StringBuilder query = new StringBuilder("from NexusMonitoring where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<NexusMonitoring> nexusMonitoringList =  q.list();
		session.close();
		if(nexusMonitoringList.isEmpty()) {
			return null;
		}
		return nexusMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NexusMonitoring> getAllNexusMonitoring() {
		StringBuilder query = new StringBuilder("from NexusMonitoring");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<NexusMonitoring> nexusMonitoringList =  q.list();
		session.close();
		return nexusMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NexusMonitoring> getAllNexusMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from NexusMonitoring where component_id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<NexusMonitoring> nexusMonitoringList =  q.list();
		session.close();
		return nexusMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public NexusMonitoring getLatestNexusMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from NexusMonitoring where component_id =:componentId and isComponentReachable = true order by monitoring_timestamp desc");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<NexusMonitoring> nexusMonitoringList =  q.list();
		session.close();
		if(nexusMonitoringList.isEmpty()) {
			return null;
		}
		return nexusMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getLatestLimitedNexusMonitoringDataByComponentId(String componentId, String lastXDays){
		StringBuilder query = new StringBuilder("select n1.id , n1.established_bgp_peers, n1.existing_extended_vlans, "
				+ "n1.existing_user_vlans, n1.existing_vlans, n1.monitoring_timestamp, n1.no_of_vrrp_enabled_interfaces, "
				+ "n1.static_routes_count, n1.total_bgp_peers, n1.total_hsrp_enabled_interfaces, n1.vrf_count, "
				+ "n1.isComponentReachable, n1.component_id "
				+ "from nexus_monitoring n1 "
				+ "inner join (select max(n3.monitoring_timestamp) as monitoring_timestamp from nexus_monitoring n3 "
				+ "where n3.component_id = '" + componentId + "' " +"and n3.isComponentReachable = true "
				+ "group by date_format(n3.monitoring_timestamp, '%Y-%m')) as n2 on n2.monitoring_timestamp = n1.monitoring_timestamp "
				+ "where n1.component_id = '" + componentId + "' "
				+ "and n1.monitoring_timestamp >= last_day(now()) + interval 1 day ");
		
		Session session = this.sessionFactory.openSession();
		
		if(ComponentsHistoryConstants.LAST_3_MONTHS.equals(lastXDays)){
			query = query.append("- interval 3 month order by n1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_6_MONTHS.equals(lastXDays)){
			query = query.append("- interval 6 month order by n1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_9_MONTHS.equals(lastXDays)){
			query = query.append("- interval 9 month order by n1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_12_MONTHS.equals(lastXDays)){
			query = query.append("- interval 12 month order by n1.monitoring_timestamp asc");
		}
		
		Query q = session.createSQLQuery(query.toString());
		List<Object[]> list = q.list();		
		session.close();
		
		return list; 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> avgNexusMonitoringVrfCountDataByComponentId(String componentId, String lastXDays){
		StringBuilder query = new StringBuilder("select month(monitoring_timestamp),year(monitoring_timestamp), AVG(vrf_count) "
				+ "from nexus_monitoring "
				+ "where component_id = '" + componentId + "' " +"and isComponentReachable = true and monitoring_timestamp >= last_day(now()) + interval 1 day ");
				
		Session session = this.sessionFactory.openSession();
		
		if(ComponentsHistoryConstants.LAST_3_MONTHS.equals(lastXDays)){
			query = query.append("- interval 3 month ");
		}else if(ComponentsHistoryConstants.LAST_6_MONTHS.equals(lastXDays)){
			query = query.append("- interval 6 month ");
		}else if(ComponentsHistoryConstants.LAST_9_MONTHS.equals(lastXDays)){
			query = query.append("- interval 9 month ");
		}else if(ComponentsHistoryConstants.LAST_12_MONTHS.equals(lastXDays)){
			query = query.append("- interval 12 month ");
		}
		
		query = query.append("group by year(monitoring_timestamp), month(monitoring_timestamp)");
		
		
		Query q = session.createSQLQuery(query.toString());
		List<Object[]> list = q.list();		
		session.close();
		
		return list; 
	}
	
	
	@Override
	public void addAsaMonitoring(AsaMonitoring nexusMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(nexusMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public void editAsaMonitoring(AsaMonitoring nexusMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.merge(nexusMonitoring);
		session.flush();
		session.close();

	}

	@Override
	public void deleteAsaMonitoring(String id) {
		Session session = this.sessionFactory.openSession();
		AsaMonitoring asaMonitoring = (AsaMonitoring) session.get(AsaMonitoring.class, id);
		session.delete(asaMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public AsaMonitoring findByAsaMonitoringId(String id) {
		Session session = this.sessionFactory.openSession();
		AsaMonitoring asaMonitoring = (AsaMonitoring) session.get(AsaMonitoring.class, id);
		session.close();
		return asaMonitoring;
	}

	@SuppressWarnings("unchecked")
	@Override
	public AsaMonitoring findByAsaMonitoringName(String name) {
		StringBuilder query = new StringBuilder("from AsaMonitoring where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<AsaMonitoring> asaMonitoringList =  q.list();
		session.close();
		if(asaMonitoringList.isEmpty()) {
			return null;
		}
		return asaMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AsaMonitoring> getAllAsaMonitoring() {
		StringBuilder query = new StringBuilder("from AsaMonitoring");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<AsaMonitoring> asaMonitoringList =  q.list();
		session.close();
		return asaMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AsaMonitoring> getAllAsaMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from AsaMonitoring where component_id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<AsaMonitoring> asaMonitoringList =  q.list();
		session.close();
		return asaMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public AsaMonitoring getLatestAsaMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from AsaMonitoring where component_id =:componentId and isComponentReachable = true order by monitoring_timestamp desc");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<AsaMonitoring> asaMonitoringList =  q.list();
		session.close();
		if(asaMonitoringList.isEmpty()) {
			return null;
		}
		return asaMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getLatestLimitedAsaMonitoringDataByComponentId(String componentId, String lastXDays){
		StringBuilder query = new StringBuilder("select a1.id , a1.total_active_security_contexts, a1.total_failover_security_contexts, "
				+ "a1.total_security_contexts, a1.monitoring_timestamp, "
				+ "a1.isComponentReachable, a1.component_id "
				+ "from asa_monitoring a1 "
				+ "inner join (select max(a3.monitoring_timestamp) as monitoring_timestamp from asa_monitoring a3 "
				+ "where a3.component_id = '" + componentId + "' " +"and a3.isComponentReachable = true "
				+ "group by date_format(a3.monitoring_timestamp, '%Y-%m')) as a2 on a2.monitoring_timestamp = a1.monitoring_timestamp "
				+ "where a1.component_id = '" + componentId + "' "
				+ "and a1.monitoring_timestamp >= last_day(now()) + interval 1 day ");
		
		Session session = this.sessionFactory.openSession();
		
		if(ComponentsHistoryConstants.LAST_3_MONTHS.equals(lastXDays)){
			query = query.append("- interval 3 month order by a1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_6_MONTHS.equals(lastXDays)){
			query = query.append("- interval 6 month order by a1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_9_MONTHS.equals(lastXDays)){
			query = query.append("- interval 9 month order by a1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_12_MONTHS.equals(lastXDays)){
			query = query.append("- interval 12 month order by a1.monitoring_timestamp asc");
		}
		
		Query q = session.createSQLQuery(query.toString());
		List<Object[]> list = q.list();		
		session.close();
		
		return list;
	}
	
	@Override
	public void addVCenterMonitoring(VCenterMonitoring vCenterMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.saveOrUpdate(vCenterMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public void editVCenterMonitoring(VCenterMonitoring vCenterMonitoring) {
		Session session = this.sessionFactory.openSession();
		session.merge(vCenterMonitoring);
		session.flush();
		session.close();

	}

	@Override
	public void deleteVCenterMonitoring(String id) {
		Session session = this.sessionFactory.openSession();
		VCenterMonitoring vCenterMonitoring = (VCenterMonitoring) session.get(VCenterMonitoring.class, id);
		session.delete(vCenterMonitoring);
		session.flush();
		session.close();
	}

	@Override
	public VCenterMonitoring findByVCenterMonitoringId(String id) {
		Session session = this.sessionFactory.openSession();
		VCenterMonitoring vCenterMonitoring = (VCenterMonitoring) session.get(VCenterMonitoring.class, id);
		session.close();
		return vCenterMonitoring;
	}

	@SuppressWarnings("unchecked")
	@Override
	public VCenterMonitoring findByVCenterMonitoringName(String name) {
		StringBuilder query = new StringBuilder("from VCenterMonitoring where name =:name");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("name", name);
		List<VCenterMonitoring> vCenterMonitoringList =  q.list();
		session.close();
		if(vCenterMonitoringList.isEmpty()) {
			return null;
		}
		return vCenterMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<VCenterMonitoring> getAllVCenterMonitoring() {
		StringBuilder query = new StringBuilder("from VCenterMonitoring");	
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		List<VCenterMonitoring> vCenterMonitoringList =  q.list();
		session.close();
		return vCenterMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<VCenterMonitoring> getAllVCenterMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from VCenterMonitoring where component_id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<VCenterMonitoring> vCenterMonitoringList =  q.list();
		session.close();
		return vCenterMonitoringList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public VCenterMonitoring getLatestVCenterMonitoringDataByComponentId(String componentId){
		StringBuilder query = new StringBuilder("from VCenterMonitoring where component_id =:componentId and isComponentReachable = true order by monitoring_timestamp desc");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		List<VCenterMonitoring> vCenterMonitoringList =  q.list();
		session.close();
		if(vCenterMonitoringList.isEmpty()) {
			return null;
		}
		return vCenterMonitoringList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getLatestLimitedVCenterMonitoringDataByComponentId(String componentId, String lastXDays){
		StringBuilder query = new StringBuilder("select v1.id , v1.total_blades, v1.total_clusters, "
				+ "v1.total_cores, v1.total_data_store, v1.total_free_data_store, v1.total_logical_cores, "
				+ "v1.total_memory, v1.total_memory_left, v1.total_on_vms, v1.total_used_data_store, "
				+ "v1.total_used_logical_cores_all, v1.total_used_logical_cores_on, v1.total_used_memory, v1.total_vms, "
				+ "v1.report_date, v1.server_ip_addr, v1.monitoring_timestamp, "
				+ "v1.isComponentReachable, v1.component_id from vcenter_monitoring v1 "
				+ "inner join (select max(v3.monitoring_timestamp) as monitoring_timestamp from vcenter_monitoring v3 "
				+ "where v3.component_id = '" + componentId + "' " +"and v3.isComponentReachable = true "
				+ "group by date_format(v3.monitoring_timestamp, '%Y-%m')) as v2 on v2.monitoring_timestamp = v1.monitoring_timestamp "
				+ "where v1.component_id = '" + componentId + "' "
				+ "and v1.monitoring_timestamp >= last_day(now()) + interval 1 day ");
		
		Session session = this.sessionFactory.openSession();
		
		if(ComponentsHistoryConstants.LAST_3_MONTHS.equals(lastXDays)){
			query = query.append("- interval 3 month order by v1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_6_MONTHS.equals(lastXDays)){
			query = query.append("- interval 6 month order by v1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_9_MONTHS.equals(lastXDays)){
			query = query.append("- interval 9 month order by v1.monitoring_timestamp asc");
		}else if(ComponentsHistoryConstants.LAST_12_MONTHS.equals(lastXDays)){
			query = query.append("- interval 12 month order by v1.monitoring_timestamp asc");
		}
		
		Query q = session.createSQLQuery(query.toString());
		List<Object[]> list = q.list();		
		session.close();
		
		return list;
	}
	
	@Override
	public void deleteNexusMonitoringByComponentId(String componentId){
		StringBuilder query = new StringBuilder("Delete from NexusMonitoring where component.id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		int deleted = q.executeUpdate();
		session.close();
	}

	@Override
	public void deleteAsaMonitoringByComponentId(String componentId){
		StringBuilder query = new StringBuilder("Delete from AsaMonitoring where component.id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		int deleted = q.executeUpdate();
		session.close();
	}
	
	@Override
	public void deleteVCenterMonitoringByComponentId(String componentId){
		StringBuilder query = new StringBuilder("Delete from VCenterMonitoring where component.id =:componentId");
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(query.toString());
		q.setParameter("componentId", componentId);
		int deleted = q.executeUpdate();
		session.close();
	}

}
