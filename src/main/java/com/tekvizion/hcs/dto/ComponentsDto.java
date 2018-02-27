package com.tekvizion.hcs.dto;


public class ComponentsDto {
	 
	private String id;
	
	private String name;
	
	private long WARN_START;
	
	private long WARN_END;
	
	private long MAX;
	
	private long STEP_VALUE;
	
	private long value;

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

	public long getWARN_START() {
		return WARN_START;
	}

	public void setWARN_START(long wARN_START) {
		WARN_START = wARN_START;
	}

	public long getWARN_END() {
		return WARN_END;
	}

	public void setWARN_END(long wARN_END) {
		WARN_END = wARN_END;
	}

	 
	public long getSTEP_VALUE() {
		return STEP_VALUE;
	}

	public void setSTEP_VALUE(long sTEP_VALUE) {
		STEP_VALUE = sTEP_VALUE;
	}

	public long getMAX() {
		return MAX;
	}

	public void setMAX(long mAX) {
		MAX = mAX;
	}

	public long getValue() {
		return value;
	}

	public void setValue(long value) {
		this.value = value;
	}
	 
	
}
