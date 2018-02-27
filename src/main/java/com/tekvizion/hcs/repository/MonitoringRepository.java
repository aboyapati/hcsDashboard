package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;


public interface MonitoringRepository  {

	public void addNexusMonitoring(NexusMonitoring nexusMonitoring);
	public void editNexusMonitoring(NexusMonitoring nexusMonitoring);
	public void deleteNexusMonitoring(String id);
	public NexusMonitoring findByNexusMonitoringId(String id);
	public NexusMonitoring findByNexusMonitoringName(String name);
	public List<NexusMonitoring> getAllNexusMonitoring();
	public List<NexusMonitoring> getAllNexusMonitoringDataByComponentId(String componentId);
	public NexusMonitoring getLatestNexusMonitoringDataByComponentId(String componentId);
	public List<Object[]> getLatestLimitedNexusMonitoringDataByComponentId(String componentId, String lastXDays);
	public List<Object[]> avgNexusMonitoringVrfCountDataByComponentId(String componentId, String lastXDays);
	
	public void deleteNexusMonitoringByComponentId(String componentId);
		
	public void addAsaMonitoring(AsaMonitoring asaMonitoring);
	public void editAsaMonitoring(AsaMonitoring asaMonitoring);
	public void deleteAsaMonitoring(String id);
	public AsaMonitoring findByAsaMonitoringId(String id);
	public AsaMonitoring findByAsaMonitoringName(String name);
	public List<AsaMonitoring> getAllAsaMonitoring();
	public List<AsaMonitoring> getAllAsaMonitoringDataByComponentId(String componentId);
	public AsaMonitoring getLatestAsaMonitoringDataByComponentId(String componentId);
	public List<Object[]> getLatestLimitedAsaMonitoringDataByComponentId(String componentId, String lastXDays);
	public void deleteAsaMonitoringByComponentId(String componentId);
	
	public void addVCenterMonitoring(VCenterMonitoring vCenterMonitoring);
	public void editVCenterMonitoring(VCenterMonitoring vCenterMonitoring);
	public void deleteVCenterMonitoring(String id);
	public VCenterMonitoring findByVCenterMonitoringId(String id);
	public VCenterMonitoring findByVCenterMonitoringName(String name);
	public List<VCenterMonitoring> getAllVCenterMonitoring();
	public List<VCenterMonitoring> getAllVCenterMonitoringDataByComponentId(String componentId);
	public VCenterMonitoring getLatestVCenterMonitoringDataByComponentId(String componentId);
	public List<Object[]> getLatestLimitedVCenterMonitoringDataByComponentId(String componentId, String lastXDays);
	public void deleteVCenterMonitoringByComponentId(String componentId);
	
}
