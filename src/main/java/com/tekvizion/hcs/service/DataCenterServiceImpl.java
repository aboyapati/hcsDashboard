package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.DataCenter;
import com.tekvizion.hcs.repository.DataCenterRepository;

@Service
public class DataCenterServiceImpl implements DataCenterService {
	
	@Autowired
	DataCenterRepository dataCenterRepository;

	@Override
	@Transactional
	public void add(DataCenter dataCenter) {
		dataCenterRepository.add(dataCenter);
	}

	@Override
	@Transactional
	public void edit(DataCenter dataCenter) {
		dataCenterRepository.edit(dataCenter);
	}

	@Override
	public void delete(String id) {
		dataCenterRepository.delete(id);
	}

	@Override
	public DataCenter findById(String id) {
		return dataCenterRepository.findById(id);
	}

	@Override
	public DataCenter findByName(String name) {
		return dataCenterRepository.findByName(name);
	}
	
	@Override
	public List<DataCenter> getAll() {
		return this.dataCenterRepository.getAll();
	}
	
	@Override
	public List<DataCenter> listDataCentersByCustomer(String customerId){
		return this.dataCenterRepository.listDataCentersByCustomer(customerId);
	}

}
