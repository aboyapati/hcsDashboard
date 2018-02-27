package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.DataCenter;

public interface DataCenterRepository  {
	/**
	 * Method to add a new instance of DataCenter
	 * @param site
	 */
	public void add(DataCenter dataCenter);

	/**
	 * Method to update the existing instance of DataCenter
	 * @param site
	 */
	public void edit(DataCenter dataCenter);

	/**
	 * Method to delete the instance of DataCenter
	 * @param Id
	 */
	public void delete(String id);

	/**
	 * Method to fetch instance of DataCenter by given id
	 * @param Id
	 * @return
	 */
	public DataCenter findById(String id);

	/**
	 * Method to find the DataCenter details using the name
	 * @param name
	 * @return
	 */
	public DataCenter findByName(String name);
	
	/**
	 * Method to list all the dataCenters
	 * @return
	 */
	public List<DataCenter> getAll();
	
	/**
	 * Method to fetch instances of DataCenter by given customerId
	 * @param customerId
	 * @return
	 */
	public List<DataCenter> listDataCentersByCustomer(String customerId);

}
