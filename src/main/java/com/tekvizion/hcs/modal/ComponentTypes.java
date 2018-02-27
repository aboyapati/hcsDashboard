package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.tekvizion.hcs.util.ComponentTypesEnum;

/**
 * Table to list the ComponentType of the customer
 * @author pgoud
 *
 */
@Entity
@Table(name="Component_Types")
public class ComponentTypes {
	
	/**
	 * Auto generated unique Id of the side
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;

	/**
	 * name of the component type
	 */
	@Column(name = "name")
	private String name;
	
	/**
	 * version of the component type
	 */
	@Column(name = "version")
	private String version;
	
	/**
	 * sub_version of the component type
	 */
	@Column(name = "sub_version")
	private String subVersion;
	
	
	/**
	 * vrf of the component type nexus
	 */
	@Column(name = "nexus_vrf_max")
	private String vrfMax;
	
	
	@Column(name = "nexus_vrf_warn_start")
	private String vrfWarnStart;
	
	
	@Column(name = "nexus_vrf_warn_end")
	private String vrfWarnEnd;
	
	
	/**
	 * bgpPeers of the component type nexus
	 */
	@Column(name = "nexus_bgppeers_max")
	private String bgpPeersMax;
	
	/**
	 * bgpPeers of the component type nexus
	 */
	@Column(name = "nexus_bgppeers_warn_start")
	private String bgpPeersWarnStart;
	
	/**
	 * bgpPeers of the component type nexus
	 */
	@Column(name = "nexus_bgppeers_warn_end")
	private String bgpPeersWarnEnd;
	
	/**
	 * vlan of the component type nexus
	 */
	@Column(name = "nexus_vlan_max")
	private String vlanMax;
	
	/**
	 * vlan of the component type nexus
	 */
	@Column(name = "nexus_vlan_warn_start")
	private String vlanWarnStart;
	
	/**
	 * vlan of the component type nexus
	 */
	@Column(name = "nexus_vlan_warn_end")
	private String vlanWarnEnd;
	
	
	/**
	 * hsrp of the component type nexus
	 */
	@Column(name = "nexus_hsrp_max")
	private String hsrpMax;
	
	/**
	 * hsrp of the component type nexus
	 */
	@Column(name = "nexus_hsrp_warn_start")
	private String hsrpWarnStart;
	
	/**
	 * hsrp of the component type nexus
	 */
	@Column(name = "nexus_hsrp_warn_end")
	private String hsrpWarnEnd;
	
	
	/**
	 * staticRoutes of the component type nexus
	 */
	@Column(name = "nexus_static_routes_max")
	private String staticRoutesMax;
	
	/**
	 * staticRoutes of the component type nexus
	 */
	@Column(name = "nexus_staticroutes_warn_start")
	private String staticRoutesWarnStart;
	
	/**
	 * staticRoutes of the component type nexus
	 */
	@Column(name = "nexus_staticroutes_warn_end")
	private String staticRoutesWarnEnd;
	
	/**
	 * id of the component type
	 */
	@Column(name = "type")
	private ComponentTypesEnum type;
	
	
	/**
	 * Datacenter of the component type
	 */
	@ManyToOne
	@JoinColumn(name="dataCenter_id")
	private DataCenter dataCenter;
	

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

	public DataCenter getDataCenter() {
		return dataCenter;
	}

	public void setDataCenter(DataCenter dataCenter) {
		this.dataCenter = dataCenter;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getSubVersion() {
		return subVersion;
	}

	public void setSubVersion(String subVersion) {
		this.subVersion = subVersion;
	}

	public String getVrfMax() {
		return vrfMax;
	}

	public void setVrfMax(String vrfMax) {
		this.vrfMax = vrfMax;
	}

	public String getVrfWarnStart() {
		return vrfWarnStart;
	}

	public void setVrfWarnStart(String vrfWarnStart) {
		this.vrfWarnStart = vrfWarnStart;
	}

	public String getVrfWarnEnd() {
		return vrfWarnEnd;
	}

	public void setVrfWarnEnd(String vrfWarnEnd) {
		this.vrfWarnEnd = vrfWarnEnd;
	}

	public String getBgpPeersMax() {
		return bgpPeersMax;
	}

	public void setBgpPeersMax(String bgpPeersMax) {
		this.bgpPeersMax = bgpPeersMax;
	}

	public String getBgpPeersWarnStart() {
		return bgpPeersWarnStart;
	}

	public void setBgpPeersWarnStart(String bgpPeersWarnStart) {
		this.bgpPeersWarnStart = bgpPeersWarnStart;
	}

	public String getBgpPeersWarnEnd() {
		return bgpPeersWarnEnd;
	}

	public void setBgpPeersWarnEnd(String bgpPeersWarnEnd) {
		this.bgpPeersWarnEnd = bgpPeersWarnEnd;
	}

	public String getVlanMax() {
		return vlanMax;
	}

	public void setVlanMax(String vlanMax) {
		this.vlanMax = vlanMax;
	}

	public String getVlanWarnStart() {
		return vlanWarnStart;
	}

	public void setVlanWarnStart(String vlanWarnStart) {
		this.vlanWarnStart = vlanWarnStart;
	}

	public String getVlanWarnEnd() {
		return vlanWarnEnd;
	}

	public void setVlanWarnEnd(String vlanWarnEnd) {
		this.vlanWarnEnd = vlanWarnEnd;
	}

	public String getHsrpMax() {
		return hsrpMax;
	}

	public void setHsrpMax(String hsrpMax) {
		this.hsrpMax = hsrpMax;
	}

	public String getHsrpWarnStart() {
		return hsrpWarnStart;
	}

	public void setHsrpWarnStart(String hsrpWarnStart) {
		this.hsrpWarnStart = hsrpWarnStart;
	}

	public String getHsrpWarnEnd() {
		return hsrpWarnEnd;
	}

	public void setHsrpWarnEnd(String hsrpWarnEnd) {
		this.hsrpWarnEnd = hsrpWarnEnd;
	}

	public String getStaticRoutesMax() {
		return staticRoutesMax;
	}

	public void setStaticRoutesMax(String staticRoutesMax) {
		this.staticRoutesMax = staticRoutesMax;
	}

	public String getStaticRoutesWarnStart() {
		return staticRoutesWarnStart;
	}

	public void setStaticRoutesWarnStart(String staticRoutesWarnStart) {
		this.staticRoutesWarnStart = staticRoutesWarnStart;
	}

	public String getStaticRoutesWarnEnd() {
		return staticRoutesWarnEnd;
	}

	public void setStaticRoutesWarnEnd(String staticRoutesWarnEnd) {
		this.staticRoutesWarnEnd = staticRoutesWarnEnd;
	}

	public ComponentTypesEnum getType() {
		return type;
	}

	public void setType(ComponentTypesEnum type) {
		this.type = type;
	}
}
