package com.tekvizion.hcs.dto;

public class NexusMonitoringVrfAvgDto {

	private double vrfAvgCount;
	private int year; 
	private int month;
	
	public double getVrfAvgCount() {
		return vrfAvgCount;
	}
	public void setVrfAvgCount(double vrfAvgCount) {
		this.vrfAvgCount = vrfAvgCount;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
}
