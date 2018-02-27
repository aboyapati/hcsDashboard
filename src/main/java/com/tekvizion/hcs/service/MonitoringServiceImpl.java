package com.tekvizion.hcs.service;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.dto.AsaMonitoringDto;
import com.tekvizion.hcs.dto.NexusMonitoringDto;
import com.tekvizion.hcs.dto.NexusMonitoringVrfAvgDto;
import com.tekvizion.hcs.dto.VCenterMonitoringDto;
import com.tekvizion.hcs.modal.AsaMonitoring;
import com.tekvizion.hcs.modal.NexusMonitoring;
import com.tekvizion.hcs.modal.VCenterMonitoring;
import com.tekvizion.hcs.repository.ComponentsRepository;
import com.tekvizion.hcs.repository.MonitoringRepository;

@Service
public class MonitoringServiceImpl implements MonitoringService {
	
	@Autowired
	MonitoringRepository monitoringRepository;
	
	@Autowired
	ComponentsRepository componentsRepository;

	@Override
	@Transactional
	public void addNexusMonitoring(NexusMonitoring nexusMonitoring) {
		monitoringRepository.addNexusMonitoring(nexusMonitoring);
	}

	@Override
	@Transactional
	public void editNexusMonitoring(NexusMonitoring nexusMonitoring) {
		monitoringRepository.editNexusMonitoring(nexusMonitoring);
	}

	@Override
	public void deleteNexusMonitoring(String id) {
		monitoringRepository.deleteNexusMonitoring(id);
	}

	@Override
	public NexusMonitoring findByNexusMonitoringId(String id) {
		return monitoringRepository.findByNexusMonitoringId(id);
	}

	@Override
	public NexusMonitoring findByNexusMonitoringName(String name) {
		return monitoringRepository.findByNexusMonitoringName(name);
	}
	
	@Override
	public List<NexusMonitoring> getAllNexusMonitoring() {
		return this.monitoringRepository.getAllNexusMonitoring();
	}
	
	@Override
	public List<NexusMonitoring> getAllNexusMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getAllNexusMonitoringDataByComponentId(componentId);
	}	
	
	@Override
	public NexusMonitoring getLatestNexusMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getLatestNexusMonitoringDataByComponentId(componentId);
	}
	
	@Override
	public List<NexusMonitoringDto> getLatestLimitedNexusMonitoringDataByComponentId(String componentId, String lastXDays){
		
		List<Object[]> list  = this.monitoringRepository.getLatestLimitedNexusMonitoringDataByComponentId(componentId, lastXDays);
		
		List<NexusMonitoringDto> nexusMonitoringDtoList =  new ArrayList<NexusMonitoringDto>();
		NexusMonitoringDto nexusMonitoringDto = null;
		
		for (Object[] row : list) {
			nexusMonitoringDto = new NexusMonitoringDto();
			nexusMonitoringDto.setId(checkNullReturnEmptyString(row[0]));
			nexusMonitoringDto.setEstablishedBgpPeers(checkNullReturnEmptyInt(row[1]));
			nexusMonitoringDto.setExistingExtendedVlans(checkNullReturnEmptyInt(row[2]));
			nexusMonitoringDto.setExistingUserVlans(checkNullReturnEmptyInt(row[3]));
			nexusMonitoringDto.setExistingVlans(checkNullReturnEmptyInt(row[4]));
			nexusMonitoringDto.setMonitoringTimestamp(checkNullReturnEmptyDate(row[5]));
			nexusMonitoringDto.setNumberOfVrrpEnabledInterfaces(checkNullReturnEmptyInt(row[6]));
			nexusMonitoringDto.setStaticRoutesCount(checkNullReturnEmptyInt(row[7]));
			nexusMonitoringDto.setTotalBgpPeers(checkNullReturnEmptyInt(row[8]));
			nexusMonitoringDto.setTotalHsrpEnabledInterfaces(checkNullReturnEmptyInt(row[9]));
			nexusMonitoringDto.setVrfCount(checkNullReturnEmptyInt(row[10]));
			nexusMonitoringDto.setComponentReachable(checkNullReturnEmptyBoolean(row[11]));
			nexusMonitoringDto.setComponentId(checkNullReturnEmptyString(row[12]));
			nexusMonitoringDtoList.add(nexusMonitoringDto);
			
		}
		return nexusMonitoringDtoList;
	}
	
	@Override
	public List<NexusMonitoringVrfAvgDto> avgNexusMonitoringVrfCountDataByComponentId(String componentId, String lastXDays){
		
		List<Object[]> list  = this.monitoringRepository.avgNexusMonitoringVrfCountDataByComponentId(componentId, lastXDays);
		
		List<NexusMonitoringVrfAvgDto> nexusMonitoringVrfAvgDtoLst =  new ArrayList<NexusMonitoringVrfAvgDto>();
		NexusMonitoringVrfAvgDto nexusMonitoringVrfAvgDto = null;
		
		for (Object[] row : list) {
			nexusMonitoringVrfAvgDto = new NexusMonitoringVrfAvgDto();
			nexusMonitoringVrfAvgDto.setMonth(Integer.parseInt(row[0].toString()));
			nexusMonitoringVrfAvgDto.setYear(Integer.parseInt(row[1].toString()));
			nexusMonitoringVrfAvgDto.setVrfAvgCount(Double.parseDouble(row[2].toString()));
			nexusMonitoringVrfAvgDtoLst.add(nexusMonitoringVrfAvgDto);
			
		}
		return nexusMonitoringVrfAvgDtoLst;
	}
	
	
	
	@Override
	@Transactional
	public void addAsaMonitoring(AsaMonitoring asaMonitoring) {
		monitoringRepository.addAsaMonitoring(asaMonitoring);
	}

	@Override
	@Transactional
	public void editAsaMonitoring(AsaMonitoring asaMonitoring) {
		monitoringRepository.editAsaMonitoring(asaMonitoring);
	}

	@Override
	public void deleteAsaMonitoring(String id) {
		monitoringRepository.deleteAsaMonitoring(id);
	}

	@Override
	public AsaMonitoring findByAsaMonitoringId(String id) {
		return monitoringRepository.findByAsaMonitoringId(id);
	}

	@Override
	public AsaMonitoring findByAsaMonitoringName(String name) {
		return monitoringRepository.findByAsaMonitoringName(name);
	}
	
	@Override
	public List<AsaMonitoring> getAllAsaMonitoring() {
		return this.monitoringRepository.getAllAsaMonitoring();
	}
	
	@Override
	public List<AsaMonitoring> getAllAsaMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getAllAsaMonitoringDataByComponentId(componentId);
	}

	@Override
	public AsaMonitoring getLatestAsaMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getLatestAsaMonitoringDataByComponentId(componentId);
	}
	
	@Override
	public List<AsaMonitoringDto> getLatestLimitedAsaMonitoringDataByComponentId(String componentId, String lastXDays){
		List<Object[]> list  = this.monitoringRepository.getLatestLimitedAsaMonitoringDataByComponentId(componentId, lastXDays);
		
		List<AsaMonitoringDto> asaMonitoringDtoList =  new ArrayList<AsaMonitoringDto>();
		AsaMonitoringDto asaMonitoringDto = null;
		
		for (Object[] row : list) {
			asaMonitoringDto = new AsaMonitoringDto();
			asaMonitoringDto.setId(checkNullReturnEmptyString(row[0]));
			asaMonitoringDto.setTotalActiveSecurityContexts(checkNullReturnEmptyInt(row[1]));
			asaMonitoringDto.setTotalFailOverSecurityContexts(checkNullReturnEmptyInt(row[2]));
			asaMonitoringDto.setTotalSecurityContexts(checkNullReturnEmptyInt(row[3]));
			asaMonitoringDto.setMonitoringTimestamp(checkNullReturnEmptyDate(row[4]));
			asaMonitoringDto.setComponentReachable(checkNullReturnEmptyBoolean(row[5]));
			asaMonitoringDto.setComponentId(checkNullReturnEmptyString(row[6]));
			asaMonitoringDtoList.add(asaMonitoringDto);			
		}
		return asaMonitoringDtoList;
	}
	
	@Override
	@Transactional
	public void addVCenterMonitoring(VCenterMonitoring vCenterMonitoring) {
		monitoringRepository.addVCenterMonitoring(vCenterMonitoring);
	}

	@Override
	@Transactional
	public void editVCenterMonitoring(VCenterMonitoring vCenterMonitoring) {
		monitoringRepository.editVCenterMonitoring(vCenterMonitoring);
	}

	@Override
	public void deleteVCenterMonitoring(String id) {
		monitoringRepository.deleteVCenterMonitoring(id);
	}

	@Override
	public VCenterMonitoring findByVCenterMonitoringId(String id) {
		return monitoringRepository.findByVCenterMonitoringId(id);
	}

	@Override
	public VCenterMonitoring findByVCenterMonitoringName(String name) {
		return monitoringRepository.findByVCenterMonitoringName(name);
	}
	
	@Override
	public List<VCenterMonitoring> getAllVCenterMonitoring() {
		return this.monitoringRepository.getAllVCenterMonitoring();
	}
	
	@Override
	public List<VCenterMonitoring> getAllVCenterMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getAllVCenterMonitoringDataByComponentId(componentId);
	}
	
	@Override
	public VCenterMonitoring getLatestVCenterMonitoringDataByComponentId(String componentId){
		return this.monitoringRepository.getLatestVCenterMonitoringDataByComponentId(componentId);
	}
	
	@Override
	public List<VCenterMonitoringDto> getLatestLimitedVCenterMonitoringDataByComponentId(String componentId, String lastXDays){
		List<Object[]> list  = this.monitoringRepository.getLatestLimitedVCenterMonitoringDataByComponentId(componentId, lastXDays);
		
		List<VCenterMonitoringDto> vCenterMonitoringDtoList =  new ArrayList<VCenterMonitoringDto>();
		VCenterMonitoringDto vCenterMonitoringDto = null;
		
		for (Object[] row : list) {
			vCenterMonitoringDto = new VCenterMonitoringDto();
			vCenterMonitoringDto.setId(checkNullReturnEmptyString(row[0]));
			vCenterMonitoringDto.setTotalBlades(checkNullReturnEmptyInt(row[1]));
			vCenterMonitoringDto.setTotalClusters(checkNullReturnEmptyInt(row[2]));
			vCenterMonitoringDto.setTotalCores(checkNullReturnEmptyString(row[3]));
			vCenterMonitoringDto.setTotalDatastore(checkNullReturnEmptyString(row[4]));			
			vCenterMonitoringDto.setTotalFreeDatastore(checkNullReturnEmptyString(row[5]));
			vCenterMonitoringDto.setTotalLogicalCores(checkNullReturnEmptyString(row[6]));
			vCenterMonitoringDto.setTotalMemory(checkNullReturnEmptyString(row[7]));
			vCenterMonitoringDto.setTotalMemoryLeft(checkNullReturnEmptyString(row[8]));
			vCenterMonitoringDto.setTotalOnVMs(checkNullReturnEmptyInt(row[9]));
			vCenterMonitoringDto.setTotalUsedDatastore(checkNullReturnEmptyString(row[10]));
			vCenterMonitoringDto.setTotalUsedLogicalCoresAll(checkNullReturnEmptyString(row[11]));
			vCenterMonitoringDto.setTotalUsedLogicalCoresOn(checkNullReturnEmptyString(row[12]));
			vCenterMonitoringDto.setTotalUsedMemory(checkNullReturnEmptyString(row[13]));
			vCenterMonitoringDto.setTotalVMs(checkNullReturnEmptyInt(row[14]));
			vCenterMonitoringDto.setReportDate(checkNullReturnEmptyDate(row[15]));
			vCenterMonitoringDto.setServerIpAddress(checkNullReturnEmptyString(row[16]));
			vCenterMonitoringDto.setMonitoringTimestamp(checkNullReturnEmptyDate(row[17]));
			vCenterMonitoringDto.setComponentReachable(checkNullReturnEmptyBoolean(row[18]));
			vCenterMonitoringDto.setComponentId(checkNullReturnEmptyString(row[19]));
			vCenterMonitoringDtoList.add(vCenterMonitoringDto);
			
		}
		return vCenterMonitoringDtoList;
	}
	
	@Override
	public void deleteNexusMonitoringByComponentId(String componentId) {
		monitoringRepository.deleteNexusMonitoringByComponentId(componentId);
	}
	
	@Override
	public void deleteAsaMonitoringByComponentId(String componentId) {
		monitoringRepository.deleteAsaMonitoringByComponentId(componentId);
	}
	
	@Override
	public void deleteVCenterMonitoringByComponentId(String componentId) {
		monitoringRepository.deleteVCenterMonitoringByComponentId(componentId);
	}
	
	/**
	 * A utility method to check whether the String is null and return empty
	 * @param rowData
	 * @return
	 */
	private String checkNullReturnEmptyString(Object rowData){
		if(rowData == null) {
			return "";
		}
		return rowData.toString();
	}
	
	/**
	 * A utility method to check whether the String is null and return empty
	 * @param rowData
	 * @return
	 */
	private int checkNullReturnEmptyInt(Object rowData){
		return Integer.parseInt(rowData.toString());
	}
	
	/**
	 * A utility method to check whether the String is null and return empty
	 * @param rowData
	 * @return
	 */
	private boolean checkNullReturnEmptyBoolean(Object rowData){
		return Boolean.parseBoolean(rowData.toString());
	}
	
	/**
	 * A utility method to check whether the String is null and return empty
	 * @param rowData
	 * @return
	 */
	private Date checkNullReturnEmptyDate(Object rowData){
		Date date = null;
		try{
			date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rowData.toString()); 
		}catch(ParseException e){
			
		}
		return date;
	}
}
