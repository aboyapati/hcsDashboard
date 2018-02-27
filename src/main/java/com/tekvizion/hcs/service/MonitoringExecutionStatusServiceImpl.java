package com.tekvizion.hcs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.MonitoringExecutionStatus;
import com.tekvizion.hcs.repository.MonitoringExecutionStatusRepository;

@Service
public class MonitoringExecutionStatusServiceImpl implements MonitoringExecutionStatusService {
	
	@Autowired
	MonitoringExecutionStatusRepository monitoringExecutionStatusRepository;


	@Override
	@Transactional
	public void addMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus){
		monitoringExecutionStatusRepository.addMonitoringExecutionStatus(monitoringExecutionStatus);
	}

	@Override
	@Transactional
	public void editMonitoringExecutionStatus(MonitoringExecutionStatus monitoringExecutionStatus){
		monitoringExecutionStatusRepository.editMonitoringExecutionStatus(monitoringExecutionStatus);
	}

	@Override
	public void deleteMonitoringExecutionStatus(String id) {
		monitoringExecutionStatusRepository.deleteMonitoringExecutionStatus(id);
	}

	@Override
	public boolean isMonitoringCommandsExecuting() {
		return monitoringExecutionStatusRepository.isMonitoringCommandsExecuting();
	}

	@Override
	public MonitoringExecutionStatus getMonitoringExecutionStatus() {
		return monitoringExecutionStatusRepository.getMonitoringExecutionStatus();
	}
	
}
