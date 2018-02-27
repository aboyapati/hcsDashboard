package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.Components;
import com.tekvizion.hcs.util.ComponentTypesEnum;


public interface ComponentsRepository  {
	/**
	 * Method to add a new instance of Component
	 * @param site
	 */
	public void add(Components component);

	/**
	 * Method to update the existing instance of Component
	 * @param site
	 */
	public void edit(Components component);

	/**
	 * Method to delete the instance of Component
	 * @param Id
	 */
	public void delete(String id);

	/**
	 * Method to fetch instance of Component by given id
	 * @param Id
	 * @return
	 */
	public Components findById(String id);

	/**
	 * Method to find the Component details using the name
	 * @param name
	 * @return
	 */
	public Components findByName(String name);
	
	/**
	 * Method to list all the Component
	 * @return
	 */
	public List<Components> getAll();
	
	/**
	 * Method to featch instances of Component by given datacenter id
	 * @param Id
	 * @return
	 */
	public List<Components> findByDataCenterId(String dataCenterId);
	
	/**
	 * Method to featch instances of Component type by given componentType Id
	 * @param Id
	 * @return
	 */
	public Components findByComponentTypeId(String componentTypeId);
	
	/**
	 * Method to find the Component details using the name,IPAddres
	 * @param name
	 * @return
	 */
	public Long findByNameAndIPAddress(String name,String ipAddress,String dataCenterId);
	
	/**
	 * Method to delete the instance of Components by DataCenter Id
	 * @param Id
	 */
	public void deleteByDataCenterId(String dataCenterId);
	
	/**
	 * Method to fetch instances of Component by given Component type
	 * @param Id
	 * @return
	 */
	public List<Components> findByComponentType(ComponentTypesEnum type);

}
