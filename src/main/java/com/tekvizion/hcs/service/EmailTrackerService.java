package com.tekvizion.hcs.service;

import com.tekvizion.hcs.modal.EmailTracker;

public interface EmailTrackerService {

	/**
	 * Method to add a new instance of EmailDetails
	 * @param EmailTracker
	 */
	public void addEmailDetails(EmailTracker emailDetails);

	/**
	 * Method to update the existing instance of EmailDetails
	 * @param emailDetails
	 */
	public void editEmailDetails(EmailTracker emailDetails);

	/**
	 * Method to delete the instance of EmailDetails
	 * @param Id
	 */
	public void deleteEmailDetails(String id);

	/**
	 * Method to fetch instance of EmailDetails by given id
	 * @param Id
	 * @return
	 */
	public EmailTracker findById(String id);
	
	public void cleanEmailTrackerDB();
}
