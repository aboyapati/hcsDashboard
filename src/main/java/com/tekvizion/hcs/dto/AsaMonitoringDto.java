package com.tekvizion.hcs.dto;

import java.util.Date;

public class AsaMonitoringDto {
	
	private String id;	
	private int totalFailOverSecurityContexts;
	private int totalActiveSecurityContexts;
	private int totalSecurityContexts;
	private boolean isComponentReachable;
    private String componentId;
	private Date monitoringTimestamp;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTotalFailOverSecurityContexts() {
		return totalFailOverSecurityContexts;
	}
	public void setTotalFailOverSecurityContexts(int totalFailOverSecurityContexts) {
		this.totalFailOverSecurityContexts = totalFailOverSecurityContexts;
	}
	public int getTotalActiveSecurityContexts() {
		return totalActiveSecurityContexts;
	}
	public void setTotalActiveSecurityContexts(int totalActiveSecurityContexts) {
		this.totalActiveSecurityContexts = totalActiveSecurityContexts;
	}
	public int getTotalSecurityContexts() {
		return totalSecurityContexts;
	}
	public void setTotalSecurityContexts(int totalSecurityContexts) {
		this.totalSecurityContexts = totalSecurityContexts;
	}
	public boolean isComponentReachable() {
		return isComponentReachable;
	}
	public void setComponentReachable(boolean isComponentReachable) {
		this.isComponentReachable = isComponentReachable;
	}
	public String getComponentId() {
		return componentId;
	}
	public void setComponentId(String componentId) {
		this.componentId = componentId;
	}
	public Date getMonitoringTimestamp() {
		return monitoringTimestamp;
	}
	public void setMonitoringTimestamp(Date monitoringTimestamp) {
		this.monitoringTimestamp = monitoringTimestamp;
	}

}
