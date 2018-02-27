package com.tekvizion.hcs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tekvizion.hcs.modal.EmailTracker;
import com.tekvizion.hcs.repository.EmailTrackerRepository;

@Service
public class EmailTrackerServiceImpl implements EmailTrackerService {

	@Autowired
	private EmailTrackerRepository emailTrackerRepository;
	
	@Override
	public void addEmailDetails(EmailTracker emailDetails) {
		this.emailTrackerRepository.addEmailDetails(emailDetails);
	}

	@Override
	public void editEmailDetails(EmailTracker emailDetails) {
		this.emailTrackerRepository.editEmailDetails(emailDetails);
	}

	@Override
	public void deleteEmailDetails(String id) {
		this.emailTrackerRepository.deleteEmailDetails(id);
	}

	@Override
	public EmailTracker findById(String id) {
		return this.emailTrackerRepository.findById(id);
	}

	@Override
	public void cleanEmailTrackerDB() {
		this.emailTrackerRepository.cleanEmailTrackerDB();
	}

}
