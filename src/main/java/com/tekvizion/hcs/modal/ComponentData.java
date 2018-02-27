package com.tekvizion.hcs.modal;

/**
 *
 */
public class ComponentData{
	
	private String id;
	
	private String componentTypeId;

	private String name;
	
	private String ipAddress;
	
	private String version;
	
	private String userName;
	
	private String password;
	
	private String monitorStatus;
	
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

	public String getComponentTypeId() {
		return componentTypeId;
	}

	public void setComponentTypeId(String componentTypeId) {
		this.componentTypeId = componentTypeId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMonitorStatus() {
		return monitorStatus;
	}

	public void setMonitorStatus(String monitorStatus) {
		this.monitorStatus = monitorStatus;
	}
}
