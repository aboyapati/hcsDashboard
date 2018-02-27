package com.tekvizion.hcs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tekvizion.hcs.modal.TimeZones;
import com.tekvizion.hcs.repository.TimeZoneRepository;

/**
 * @author btadiboyina
 *
 */
@Service
public class TimeZoneServiceImpl implements TimeZoneService {

	@Autowired
	private TimeZoneRepository timeZoneRepository;
	
	@Override
	public void addTimeZone(TimeZones timeZone) {
		timeZoneRepository.addTimeZone(timeZone);
	}

	@Override
	public void editTimeZone(TimeZones timeZone) {
		timeZoneRepository.editTimeZone(timeZone);
		
	}

	@Override
	public void deleteTimeZone(String id) {
		timeZoneRepository.deleteTimeZone(id);
	}

	@Override
	public TimeZones findById(String id) {
		return timeZoneRepository.findById(id);
	}

	@Override
	public List<TimeZones> listAllTimeZones() {
		return timeZoneRepository.listAllTimeZones();
	}

	@Override
	public TimeZones findByName(String name) {
		return timeZoneRepository.findByName(name);
	}

}
