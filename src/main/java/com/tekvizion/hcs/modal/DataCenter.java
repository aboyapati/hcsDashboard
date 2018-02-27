package com.tekvizion.hcs.modal;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.tekvizion.hcs.modal.TimeZones;

/**
 * Table to list the sites of the customer
 * @author pgoud
 *
 */
@Entity
public class DataCenter {
	
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
	 * country name of the data center
	 */
	@Column(name = "country")
	private String country;

	/**
	 * state name of the data center
	 */
	@Column(name = "state")
	private String state;

	/**
	 * city name of the data center
	 */
	@Column(name = "city")
	private String city;

	/**
	 * Timezone of the data center
	 */
	@ManyToOne
	@JoinColumn(name="timeZone_id")
	private TimeZones timeZone;
	
	
	
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

	public TimeZones getTimeZone() {
		return timeZone;
	}

	public void setTimeZone(TimeZones timeZone) {
		this.timeZone = timeZone;
	}
	
	

}
