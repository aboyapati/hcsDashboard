package com.tekvizion.hcs.repository;

import com.tekvizion.hcs.modal.MonitoringExecutionStatus;


public interface MonitoringExecutionStatusRepository  {

	public void addMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus);
	public void editMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus);
	public void deleteMonitoringExecutionStatus(String id);
	public boolean isMonitoringCommandsExecuting();
	public MonitoringExecutionStatus getMonitoringExecutionStatus();
	
}
