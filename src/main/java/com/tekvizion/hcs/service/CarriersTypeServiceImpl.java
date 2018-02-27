/**
 * 
 */
package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tekvizion.hcs.modal.CarriersType;
import com.tekvizion.hcs.repository.CarriersTypeRepository;

/**
 * @author vrkatari
 *
 */
@Service
public class CarriersTypeServiceImpl implements CarriersTypeService {
	
	@Autowired
	private CarriersTypeRepository carriersTypeRepository;
	
	@Override
	@Transactional
	public void add(CarriersType userType) {
		this.carriersTypeRepository.add(userType);	
	}

	@Override
	@Transactional
	public void edit(CarriersType userType) {
		this.carriersTypeRepository.edit(userType);
	}

	
	@Override
	public CarriersType findById(String id) {
		return this.carriersTypeRepository.findById(id);
	}

	@Override
	public List<CarriersType> getAll() {
		return this.carriersTypeRepository.getAll();
	}
	
	@Override
	public CarriersType findByName(String name) {
		return this.carriersTypeRepository.findByName(name);
	}

}
