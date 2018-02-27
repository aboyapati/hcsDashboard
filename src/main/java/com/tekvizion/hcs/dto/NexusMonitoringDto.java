package com.tekvizion.hcs.dto;

import java.util.Date;

public class NexusMonitoringDto {

	private String id;
	private int vrfCount;
	private int totalBgpPeers;
	private int establishedBgpPeers;
	private int existingVlans;
	private int existingUserVlans;
	private int existingExtendedVlans;
	private int totalHsrpEnabledInterfaces;
	private int numberOfVrrpEnabledInterfaces;
	private int staticRoutesCount;
	private boolean isComponentReachable;
    private String componentId;
	private Date monitoringTimestamp;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getVrfCount() {
		return vrfCount;
	}
	public void setVrfCount(int vrfCount) {
		this.vrfCount = vrfCount;
	}
	public int getTotalBgpPeers() {
		return totalBgpPeers;
	}
	public void setTotalBgpPeers(int totalBgpPeers) {
		this.totalBgpPeers = totalBgpPeers;
	}
	public int getEstablishedBgpPeers() {
		return establishedBgpPeers;
	}
	public void setEstablishedBgpPeers(int establishedBgpPeers) {
		this.establishedBgpPeers = establishedBgpPeers;
	}
	public int getExistingVlans() {
		return existingVlans;
	}
	public void setExistingVlans(int existingVlans) {
		this.existingVlans = existingVlans;
	}
	public int getExistingUserVlans() {
		return existingUserVlans;
	}
	public void setExistingUserVlans(int existingUserVlans) {
		this.existingUserVlans = existingUserVlans;
	}
	public int getExistingExtendedVlans() {
		return existingExtendedVlans;
	}
	public void setExistingExtendedVlans(int existingExtendedVlans) {
		this.existingExtendedVlans = existingExtendedVlans;
	}
	public int getTotalHsrpEnabledInterfaces() {
		return totalHsrpEnabledInterfaces;
	}
	public void setTotalHsrpEnabledInterfaces(int totalHsrpEnabledInterfaces) {
		this.totalHsrpEnabledInterfaces = totalHsrpEnabledInterfaces;
	}
	public int getNumberOfVrrpEnabledInterfaces() {
		return numberOfVrrpEnabledInterfaces;
	}
	public void setNumberOfVrrpEnabledInterfaces(int numberOfVrrpEnabledInterfaces) {
		this.numberOfVrrpEnabledInterfaces = numberOfVrrpEnabledInterfaces;
	}
	public int getStaticRoutesCount() {
		return staticRoutesCount;
	}
	public void setStaticRoutesCount(int staticRoutesCount) {
		this.staticRoutesCount = staticRoutesCount;
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
