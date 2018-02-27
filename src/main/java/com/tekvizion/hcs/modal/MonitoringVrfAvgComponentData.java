package com.tekvizion.hcs.modal;

import java.util.List;

import com.tekvizion.hcs.dto.NexusMonitoringVrfAvgDto;

public class MonitoringVrfAvgComponentData {
	
	private ComponentData componentData;
	
	private List<NexusMonitoringVrfAvgDto> nexusMonitoringVrfAvgDtoLst;

	public ComponentData getComponentData() {
		return componentData;
	}

	public void setComponentData(ComponentData componentData) {
		this.componentData = componentData;
	}

	public List<NexusMonitoringVrfAvgDto> getNexusMonitoringVrfAvgDtoLst() {
		return nexusMonitoringVrfAvgDtoLst;
	}

	public void setNexusMonitoringVrfAvgDtoLst(List<NexusMonitoringVrfAvgDto> nexusMonitoringVrfAvgDtoLst) {
		this.nexusMonitoringVrfAvgDtoLst = nexusMonitoringVrfAvgDtoLst;
	}
	
	

}
