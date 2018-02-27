package com.tekvizion.hcs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.modal.Provisioning;
import com.tekvizion.hcs.repository.DataCenterRepository;

@Service
public class ProvisioningServiceImpl implements ProvisioningService{
	
	@Autowired
	private DataCenterRepository dataCenterRepository;
	
	public List<Provisioning> getProvisioningData(){
		List<DataCenter> dataCenterList = dataCenterRepository.getAll();
		List<Provisioning> provisioningList = new ArrayList<Provisioning>();
		Provisioning provisioning = null;
		for(DataCenter dataCenter : dataCenterList){
			provisioning = new Provisioning();
			provisioning.setName(dataCenter.getName());
			provisioning.setCity(dataCenter.getCity());
			provisioning.setCountry(dataCenter.getCountry());
			provisioning.setState(dataCenter.getState());
			provisioning.setTimezone(dataCenter.getTimeZone());
			provisioning.setDataCenterId(dataCenter.getId());
			provisioningList.add(provisioning);
		}
		return provisioningList;
	}

}
