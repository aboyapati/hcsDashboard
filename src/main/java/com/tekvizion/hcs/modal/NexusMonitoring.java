package com.tekvizion.hcs.modal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Table to list the ComponentType of the customer
 * @author pgoud
 *
 */
@Entity
@Table(name="nexus_monitoring")
public class NexusMonitoring {
	/**
	 * Auto generated unique Id of the nexus
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	
	/**
	 * vrf of the component type nexus
	 */
	@Column(name = "vrf_count")
	private int vrfCount;
	
	
	/**
	 * total bgpPeers of the component type nexus
	 */
	@Column(name = "total_bgp_peers")
	private int totalBgpPeers;
	
	/**
	 * established bgpPeers of the component type nexus
	 */
	@Column(name = "established_bgp_peers")
	private int establishedBgpPeers;
	
	/**
	 * existingvlans of the component type nexus
	 */
	@Column(name = "existing_vlans")
	private int existingVlans;
	
	/**
	 * existing user vlans of the component type nexus
	 */
	@Column(name = "existing_user_vlans")
	private int existingUserVlans;
	
	/**
	 * existing extended vlans of the component type nexus
	 */
	@Column(name = "existing_extended_vlans")
	private int existingExtendedVlans;
	
	
	/**
	 * total hsrp enabled interfaces of the component type nexus
	 */
	@Column(name = "total_hsrp_enabled_interfaces")
	private int totalHsrpEnabledInterfaces;
	
	
	/**
	 * no of vrrp enabled interfaces of the component type nexus
	 */
	@Column(name = "no_of_vrrp_enabled_interfaces")
	private int numberOfVrrpEnabledInterfaces;
	
	
	/**
	 * static routes count of the component type nexus
	 */
	@Column(name = "static_routes_count")
	private int staticRoutesCount;
	
	/**
	 * ComponentType of the component
	 */
	@ManyToOne
	@JoinColumn(name="component_id")
    private Components component;
	
	/**
	 * monitoring timestamp of the component type nexus
	 */
	@Column(name = "monitoring_timestamp")
	private Date monitoringTimestamp;
	
	/**
	 * isComponentReachable of the component type nexus
	 */
	@Column(name = "isComponentReachable",  columnDefinition="tinyint(1) default 1")
	private boolean isComponentReachable;
	
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

	public Components getComponent() {
		return component;
	}

	public void setComponent(Components component) {
		this.component = component;
	}

	public Date getMonitoringTimestamp() {
		return monitoringTimestamp;
	}

	public void setMonitoringTimestamp(Date monitoringTimestamp) {
		this.monitoringTimestamp = monitoringTimestamp;
	}

	public boolean isComponentReachable() {
		return isComponentReachable;
	}

	public void setComponentReachable(boolean isComponentReachable) {
		this.isComponentReachable = isComponentReachable;
	}
	
}
