package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.ComponentTypes;
import com.tekvizion.hcs.util.ComponentTypesEnum;


public interface ComponentTypesRepository  {
	/**
	 * Method to add a new instance of ComponentTypes
	 * @param site
	 */
	public void add(ComponentTypes componentTypes);

	/**
	 * Method to update the existing instance of ComponentTypes
	 * @param site
	 */
	public void edit(ComponentTypes componentTypes);

	/**
	 * Method to delete the instance of ComponentTypes
	 * @param Id
	 */
	public void delete(String id);

	/**
	 * Method to fetch instance of ComponentTypes by given id
	 * @param Id
	 * @return
	 */
	public ComponentTypes findById(String id);

	/**
	 * Method to find the ComponentTypes details using the name
	 * @param name
	 * @return
	 */
	public ComponentTypes findByName(String name);
	
	/**
	 * Method to list all the componentTypes
	 * @return
	 */
	public List<ComponentTypes> getAll();
	
	/**
	 * Method to fetch instances of Component Types by given datacenter id
	 * @param Id
	 * @return
	 */
	public List<ComponentTypes> findByDataCenterId(String dataCenterId);
	
	/**
	 * Method to find the Component Type details using the type
	 * @param type
	 * @return
	 */
	public List<ComponentTypes> findByType(ComponentTypesEnum type,String dataCenterId);
	
	/**
	 * Method to delete the instance of Component Types by DataCenter Id
	 * @param Id
	 */
	public void deleteByDataCenterId(String dataCenterId);
	
}
