/**
 * 
 */
package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.CarriersType;

/**
 * @author vrkatari
 *
 */
public interface CarriersTypeRepository {
	
	/**
	 * Method to add a new carriers type
	 * @param carriers Type
	 */
	public void add(CarriersType carriersType);
	
	/**
	 * Method to modify existing carriers type
	 * @param carriers Type
	 */
	public void edit(CarriersType carriersType);
	
	
	/**
	 * Method to find the instance of carriers Type with given id
	 * @param id
	 * @return CarriersType
	 */
	public CarriersType findById(String id);
	
	/**
	 * Method to list all the carriers Type
	 * @return
	 */
	public List<CarriersType> getAll();
	
	/**
	 * Method to find the instance of carriers Type with given name
	 * @param name
	 * @return CarriersType
	 */
	public CarriersType findByName(String name);

}
