package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.repository.ComponentTypesRepository;
import com.tekvizion.hcs.util.ComponentTypesEnum;

@Service
public class ComponentTypesServiceImpl implements ComponentTypesService {
	
	@Autowired
	ComponentTypesRepository componentTypesRepository;

	@Override
	@Transactional
	public void add(ComponentTypes componentType) {
		componentTypesRepository.add(componentType);
	}

	@Override
	@Transactional
	public void edit(ComponentTypes componentType) {
		componentTypesRepository.edit(componentType);
	}

	@Override
	public void delete(String id) {
		componentTypesRepository.delete(id);
	}

	@Override
	public ComponentTypes findById(String id) {
		return componentTypesRepository.findById(id);
	}

	@Override
	public ComponentTypes findByName(String name) {
		return componentTypesRepository.findByName(name);
	}
	
	@Override
	public List<ComponentTypes> getAll() {
		return this.componentTypesRepository.getAll();
	}
	
	@Override
	public List<ComponentTypes> findByDataCenterId(String dataCenterId){
		return this.componentTypesRepository.findByDataCenterId(dataCenterId);
	}

	@Override
	public List<ComponentTypes> findByType(ComponentTypesEnum type,String dataCenterId ) {
		 
		return this.componentTypesRepository.findByType(type,dataCenterId);
	}
	
	@Override
	public void deleteByDataCenterId(String dataCenterId){
		this.componentTypesRepository.deleteByDataCenterId(dataCenterId);
	}

}
