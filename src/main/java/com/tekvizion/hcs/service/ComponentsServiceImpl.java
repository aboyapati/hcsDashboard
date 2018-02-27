package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.repository.ComponentsRepository;
import com.tekvizion.hcs.util.ComponentTypesEnum;

@Service
public class ComponentsServiceImpl implements ComponentsService {
	
	@Autowired
	ComponentsRepository componentsRepository;

	@Override
	@Transactional
	public void add(Components component) {
		componentsRepository.add(component);
	}

	@Override
	@Transactional
	public void edit(Components component) {
		componentsRepository.edit(component);
	}

	@Override
	public void delete(String id) {
		componentsRepository.delete(id);
	}

	@Override
	public Components findById(String id) {
		return componentsRepository.findById(id);
	}

	@Override
	public Components findByName(String name) {
		return componentsRepository.findByName(name);
	}
	
	@Override
	public List<Components> getAll() {
		return this.componentsRepository.getAll();
	}

	@Override
	public List<Components> findByDataCenterId(String dataCenterId){
		return this.componentsRepository.findByDataCenterId(dataCenterId);
	}

	@Override
	public Components findByComponentTypeId(String componentTypeId) {
		return this.componentsRepository.findByComponentTypeId(componentTypeId);
	}

	@Override
	public Long findByNameAndIPAddress(String name, String ipAddress,String dataCenterId) {
		return this.componentsRepository.findByNameAndIPAddress(name,ipAddress,dataCenterId);
	}
	
	@Override
	public void deleteByDataCenterId(String dataCenterId){
		this.componentsRepository.deleteByDataCenterId(dataCenterId);
	}
	
	@Override
	public List<Components> findByComponentType(ComponentTypesEnum type){
		return this.componentsRepository.findByComponentType(type);
	}
	
}
