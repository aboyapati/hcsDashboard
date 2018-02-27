package com.tekvizion.hcs.repository;

import java.util.List;

import com.tekvizion.hcs.modal.TimeZones;

/**
 * @author btadiboyina
 *
 */
public interface TimeZoneRepository {
	
	/**
	 * Method to add a new instance of TimeZones
	 * @param timeZone
	 */
	public void addTimeZone(TimeZones timeZone);

	/**
	 * Method to update the existing instance of TimeZones
	 * @param timeZone
	 */
	public void editTimeZone(TimeZones timeZone);

	/**
	 * Method to delete the instance of TimeZones
	 * @param Id
	 */
	public void deleteTimeZone(String id);
	
	/**
	 * Method to fetch instance of TimeZones by given name
	 * @return
	 */
	public TimeZones findByName(String name);
	/**
	 * Method to fetch instance of TimeZones by given id
	 * @param Id
	 * @return
	 */
	public TimeZones findById(String id);
	
	/**
	 * Method to list all timeZones details
	 *
	 * @return
	 */
	public List<TimeZones> listAllTimeZones();

}
