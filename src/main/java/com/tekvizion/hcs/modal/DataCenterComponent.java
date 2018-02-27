package com.tekvizion.hcs.modal;

import java.util.List;

import com.tekvizion.hcs.dto.DataCenterDto;

public class DataCenterComponent {
	
	private String id;
	private String name;
	private String country;
	private String state;
	private String city;
	private String status;  
	
	private List<ComponentData> componentData;
	
	public void setComponentData(List<ComponentData> componentData) {
		this.componentData = componentData;
	}

	public List<ComponentData> getComponentData() {
		return componentData;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
