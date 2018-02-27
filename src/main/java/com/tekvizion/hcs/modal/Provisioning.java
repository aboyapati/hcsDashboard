package com.tekvizion.hcs.modal;

public class Provisioning {
	
	private String name;
	
	private String country;

	private String state;

	private String city;
	
	private TimeZones timezone;
	
	private String dataCenterId;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public TimeZones getTimezone() {
		return timezone;
	}

	public void setTimezone(TimeZones timezone) {
		this.timezone = timezone;
	}

	public String getDataCenterId() {
		return dataCenterId;
	}

	public void setDataCenterId(String dataCenterId) {
		this.dataCenterId = dataCenterId;
	}

}
