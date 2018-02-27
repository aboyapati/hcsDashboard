package com.tekvizion.hcs.modal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Table to list the ComponentType of the customer
 * @author pgoud
 *
 */
@Entity
@Table(name="asa_monitoring")
public class AsaMonitoring {
	/**
	 * Auto generated unique Id of the ASA
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;	
	
	/**
	 * totalFailOverSecurityContexts of the component type ASA
	 */
	@Column(name = "total_failover_security_contexts")
	private int totalFailOverSecurityContexts;
	
	
	/**
	 * totalActiveSecurityContexts of the component type ASA
	 */
	@Column(name = "total_active_security_contexts")
	private int totalActiveSecurityContexts;
	
	/**
	 * totalSecurityContexts of the component type ASA
	 */
	@Column(name = "total_security_contexts")
	private int totalSecurityContexts;
	
	/**
	 * monitoring timestamp of the component type ASA
	 */
	@Column(name = "monitoring_timestamp")
	private Date monitoringTimestamp;	
	
	/**
	 * ComponentType of the component ASA
	 */
	@ManyToOne
	@JoinColumn(name="component_id")
    private Components component;	
	
	/**
	 * isComponentReachable of the component type ASA
	 */
	@Column(name = "isComponentReachable",  columnDefinition="tinyint(1) default 1")
	private boolean isComponentReachable;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

 

	public int getTotalActiveSecurityContexts() {
		return totalActiveSecurityContexts;
	}

	public void setTotalActiveSecurityContexts(int totalActiveSecurityContexts) {
		this.totalActiveSecurityContexts = totalActiveSecurityContexts;
	}

	public Date getMonitoringTimestamp() {
		return monitoringTimestamp;
	}

	public void setMonitoringTimestamp(Date monitoringTimestamp) {
		this.monitoringTimestamp = monitoringTimestamp;
	}

	public Components getComponent() {
		return component;
	}

	public void setComponent(Components component) {
		this.component = component;
	}

	public int getTotalFailOverSecurityContexts() {
		return totalFailOverSecurityContexts;
	}

	public void setTotalFailOverSecurityContexts(int totalFailOverSecurityContexts) {
		this.totalFailOverSecurityContexts = totalFailOverSecurityContexts;
	}

	public int getTotalSecurityContexts() {
		return totalSecurityContexts;
	}

	public void setTotalSecurityContexts(int totalSecurityContexts) {
		this.totalSecurityContexts = totalSecurityContexts;
	}

	public boolean isComponentReachable() {
		return isComponentReachable;
	}

	public void setComponentReachable(boolean isComponentReachable) {
		this.isComponentReachable = isComponentReachable;
	}
	
}
