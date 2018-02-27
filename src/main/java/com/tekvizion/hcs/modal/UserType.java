package com.tekvizion.hcs.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class UserType {
	
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid", strategy = "uuid")
	String usertypeid;
	
	/**
	 * This name is user internally in the code
	 */
	@Column(name="name")
	String name;
	
	@Column(name="description")
	String description;

	/**
	 * This flag is used to hide the roles and block the visibility to the admin while creating users
	 */
	@Column(name="active", columnDefinition="tinyint(1) default true")
	boolean active = true;
	
	public String getUsertypeid() {
		return usertypeid;
	}

	public void setUsertypeid(String usertypeid) {
		this.usertypeid = usertypeid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
}