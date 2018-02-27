package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Table to capture the execution_status of the VM's monitoring
 * @author pgoud
 *
 */
@Entity
@Table(name="monitoring_execution_status")
public class MonitoringExecutionStatus {
	/**
	 * Auto generated unique Id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;

	/**
	 * execution from Cron or onDemand
	 */
	@Column(name = "last_execution_from")
	private String lastExecutionFrom;
	
	/**
	 * execution_status of the vm monitoring
	 */
	@Column(name = "execution_status",columnDefinition="tinyint(1) default false")
	private boolean executionStatus;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLastExecutionFrom() {
		return lastExecutionFrom;
	}

	public void setLastExecutionFrom(String lastExecutionFrom) {
		this.lastExecutionFrom = lastExecutionFrom;
	}

	public boolean isExecutionStatus() {
		return executionStatus;
	}

	public void setExecutionStatus(boolean executionStatus) {
		this.executionStatus = executionStatus;
	}

}
