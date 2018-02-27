package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

/**
 * Table to list the sites of the customer
 * @author pgoud
 *
 */
@Entity
public class Components {
	
	/**
	 * Auto generated unique Id of the side
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;

	/**
	 * name of the data center
	 */
	@Column(name = "name")
	private String name;
	
	/**
	 * Datacenter of the component
	 */
	@ManyToOne
	@JoinColumn(name="dataCenter_id")
	private DataCenter dataCenter;
	
	/**
	 * ComponentType of the component
	 */
	@ManyToOne
	@JoinColumn(name="component_type_id")
    private ComponentTypes componentType;
	
	/**
	 * ipaddress of the Component
	 */
	@Column(name = "ipaddress")
	private String ipAddress;
	
	/**
	 * ipaddress of the Component
	 */
	@Column(name = "version")
	private String version;
	
	/**
	 * username of the Component
	 */
	@Column(name = "username")
	private String userName;
	
	/**
	 * password of the Component
	 */
	@Column(name = "password")
	private String password;
	
	/**
	 * password of the Component
	 */
	@Column(name = "monitor_status")
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

	public DataCenter getDataCenter() {
		return dataCenter;
	}

	public void setDataCenter(DataCenter dataCenter) {
		this.dataCenter = dataCenter;
	}

	public ComponentTypes getComponentType() {
		return componentType;
	}

	public void setComponentType(ComponentTypes componentType) {
		this.componentType = componentType;
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
