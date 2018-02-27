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

@Entity
@Table(name="vcenter_monitoring")
public class VCenterMonitoring {
		/**
		 * Auto generated unique Id of the VCenter
		 */
		@Id
		@GeneratedValue(generator = "system-uuid")
		@GenericGenerator(name = "system-uuid", strategy = "uuid")
		private String id;
		
		/**
		 * Report Date of the component type VCenter
		 */
		@Column(name = "server_ip_addr")
		private String serverIpAddress;
		
		/**
		 * Total Clusters of the component type VCenter
		 */
		@Column(name = "report_date")
		private Date reportDate;
		
		/**
		 * Total Clusters of the component type VCenter
		 */
		@Column(name = "total_clusters")
		private int TotalClusters;
		
		/**
		 * Total Blades of the component type VCenter
		 */
		@Column(name = "total_blades")
		private int TotalBlades;
		
		/**
		 * TotalCores of the component type VCenter
		 */
		@Column(name = "total_cores")
		private String TotalCores;
		
		/**
		 * TotalLogicalCores of the component type VCenter
		 */
		@Column(name = "total_logical_cores")
		private String TotalLogicalCores;
		
		/**
		 * TotalUsedLogicalCoresAll of the component type VCenter
		 */
		@Column(name = "total_used_logical_cores_all")
		private String TotalUsedLogicalCoresAll;
		
		/**
		 * TotalUsedLogicalCoresOn of the component type VCenter
		 */
		@Column(name = "total_used_logical_cores_on")
		private String TotalUsedLogicalCoresOn;
		
		/**
		 * TotalMemory of the component type VCenter
		 */
		@Column(name = "total_memory")
		private String TotalMemory;
		
		/**
		 * TotalUsedMemory of the component type VCenter
		 */
		@Column(name = "total_used_memory")
		private String TotalUsedMemory;
		
		/**
		 * TotalMemoryLeft of the component type VCenter
		 */
		@Column(name = "total_memory_left")
		private String TotalMemoryLeft;
		
		/**
		 * Total VMs of the component type VCenter
		 */
		@Column(name = "total_vms")
		private int TotalVMs;
		
		/**
		 * TotalMemoryLeft of the component type VCenter
		 */
		@Column(name = "total_on_vms")
		private int TotalOnVMs;
		
		/**
		 * TotalDatastore of the component type VCenter
		 */
		@Column(name = "total_data_store")
		private String TotalDatastore;
		
		/**
		 * TotalUsedDatastore of the component type VCenter
		 */
		@Column(name = "total_used_data_store")
		private String TotalUsedDatastore;
		
		/**
		 * TotalFreeDatastore of the component type VCenter
		 */
		@Column(name = "total_free_data_store")
		private String TotalFreeDatastore;

		/**
		 * monitoring timestamp of the component type VCenter
		 */
		@Column(name = "monitoring_timestamp")
		private Date monitoringTimestamp;
		
		/**
		 * ComponentType of the component
		 */
		@ManyToOne
		@JoinColumn(name="component_id")
	    private Components component;
		
		/**
		 * isComponentReachable of the component type VCenter
		 */
		@Column(name = "isComponentReachable",  columnDefinition="tinyint(1) default 1")
		private boolean isComponentReachable;

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

		public Date getMonitoringTimestamp() {
			return monitoringTimestamp;
		}

		public void setMonitoringTimestamp(Date monitoringTimestamp) {
			this.monitoringTimestamp = monitoringTimestamp;
		}

		public Components getComponent() {
			return component;
		}

		public void setComponent(Components component) {
			this.component = component;
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

		public boolean isComponentReachable() {
			return isComponentReachable;
		}

		public void setComponentReachable(boolean isComponentReachable) {
			this.isComponentReachable = isComponentReachable;
		}
		
}
