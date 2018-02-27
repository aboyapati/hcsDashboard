package com.tekvizion.hcs.dto;

import java.util.Date;

public class VCenterMonitoringDto {
	private String id;
	private String serverIpAddress;
	private Date reportDate;
	private int TotalClusters;
	private int TotalBlades;
	private String TotalCores;
	private String TotalLogicalCores;
	private String TotalUsedLogicalCoresAll;
	private String TotalUsedLogicalCoresOn;
	private String TotalMemory;
	private String TotalUsedMemory;
	private String TotalMemoryLeft;
	private int TotalVMs;
	private int TotalOnVMs;
	private String TotalDatastore;
	private String TotalUsedDatastore;
	private String TotalFreeDatastore;
	private boolean isComponentReachable;
    private String componentId;
	private Date monitoringTimestamp;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getServerIpAddress() {
		return serverIpAddress;
	}
	public void setServerIpAddress(String serverIpAddress) {
		this.serverIpAddress = serverIpAddress;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public int getTotalClusters() {
		return TotalClusters;
	}
	public void setTotalClusters(int totalClusters) {
		TotalClusters = totalClusters;
	}
	public int getTotalBlades() {
		return TotalBlades;
	}
	public void setTotalBlades(int totalBlades) {
		TotalBlades = totalBlades;
	}
	public String getTotalCores() {
		return TotalCores;
	}
	public void setTotalCores(String totalCores) {
		TotalCores = totalCores;
	}
	public String getTotalLogicalCores() {
		return TotalLogicalCores;
	}
	public void setTotalLogicalCores(String totalLogicalCores) {
		TotalLogicalCores = totalLogicalCores;
	}
	public String getTotalUsedLogicalCoresAll() {
		return TotalUsedLogicalCoresAll;
	}
	public void setTotalUsedLogicalCoresAll(String totalUsedLogicalCoresAll) {
		TotalUsedLogicalCoresAll = totalUsedLogicalCoresAll;
	}
	public String getTotalUsedLogicalCoresOn() {
		return TotalUsedLogicalCoresOn;
	}
	public void setTotalUsedLogicalCoresOn(String totalUsedLogicalCoresOn) {
		TotalUsedLogicalCoresOn = totalUsedLogicalCoresOn;
	}
	public String getTotalMemory() {
		return TotalMemory;
	}
	public void setTotalMemory(String totalMemory) {
		TotalMemory = totalMemory;
	}
	public String getTotalUsedMemory() {
		return TotalUsedMemory;
	}
	public void setTotalUsedMemory(String totalUsedMemory) {
		TotalUsedMemory = totalUsedMemory;
	}
	public String getTotalMemoryLeft() {
		return TotalMemoryLeft;
	}
	public void setTotalMemoryLeft(String totalMemoryLeft) {
		TotalMemoryLeft = totalMemoryLeft;
	}
	public int getTotalVMs() {
		return TotalVMs;
	}
	public void setTotalVMs(int totalVMs) {
		TotalVMs = totalVMs;
	}
	public int getTotalOnVMs() {
		return TotalOnVMs;
	}
	public void setTotalOnVMs(int totalOnVMs) {
		TotalOnVMs = totalOnVMs;
	}
	public String getTotalDatastore() {
		return TotalDatastore;
	}
	public void setTotalDatastore(String totalDatastore) {
		TotalDatastore = totalDatastore;
	}
	public String getTotalUsedDatastore() {
		return TotalUsedDatastore;
	}
	public void setTotalUsedDatastore(String totalUsedDatastore) {
		TotalUsedDatastore = totalUsedDatastore;
	}
	public String getTotalFreeDatastore() {
		return TotalFreeDatastore;
	}
	public void setTotalFreeDatastore(String totalFreeDatastore) {
		TotalFreeDatastore = totalFreeDatastore;
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
